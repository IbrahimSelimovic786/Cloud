#!/bin/bash
# userdata_frontend.sh

# Update system
yum update -y

# Install Docker
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Git
yum install git -y

# Wait for EBS volume to be attached
sleep 30

# Format and mount EBS volume
mkfs -t ext4 /dev/xvdf
mkdir /app-data
mount /dev/xvdf /app-data
echo '/dev/xvdf /app-data ext4 defaults,nofail 0 2' >> /etc/fstab

# Clone repository
cd /home/ec2-user
git clone ${git_repo_url} app
cd app
chown -R ec2-user:ec2-user /home/ec2-user/app

# Create frontend docker-compose file
cat > docker-compose-frontend.yml << 'EOF'
version: '3.8'

services:
  frontend:
    build: ./frontend
    container_name: vue-frontend
    volumes:
      - ./frontend/src:/app/src
      - /app/node_modules
      - /app-data/frontend-logs:/app/logs
    ports:
      - "80:80"
    environment:
      - VUE_APP_API_URL=http://${backend_url}/api
    restart: always
    networks:
      - frontend-network

networks:
  frontend-network:
    driver: bridge

volumes:
  frontend-data:
    driver: local
EOF

# Create environment file
cat > .env << EOF
BACKEND_URL=${backend_url}
EOF

# Build and start frontend
docker-compose -f docker-compose-frontend.yml up -d

# Create a startup script for auto-restart
cat > /home/ec2-user/start-frontend.sh << 'EOF'
#!/bin/bash
cd /home/ec2-user/app
docker-compose -f docker-compose-frontend.yml up -d
EOF

chmod +x /home/ec2-user/start-frontend.sh

# Add to crontab for startup
echo "@reboot /home/ec2-user/start-frontend.sh" | crontab -u ec2-user -

# Log completion
echo "Frontend setup completed at $(date)" >> /var/log/user-data.log