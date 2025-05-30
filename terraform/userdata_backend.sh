#!/bin/bash
# userdata_backend.sh

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

# Wait for RDS to be ready
sleep 60

# Create backend docker-compose file
cat > docker-compose-backend.yml << 'EOF'
version: '3.8'

services:
  backend:
    build: ./backend
    container_name: spring-backend
    environment:
      SPRING_DATASOURCE_URL: jdbc:mysql://${db_host}/${db_name}?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
      SPRING_DATASOURCE_USERNAME: ${db_username}
      SPRING_DATASOURCE_PASSWORD: ${db_password}
      SPRING_JPA_HIBERNATE_DDL_AUTO: update
      SPRING_JPA_SHOW_SQL: false
      SERVER_PORT: 8085
    ports:
      - "8085:8085"
    networks:
      - backend-network
    volumes:
      - ./backend/src:/workspace/app/src
      - /app-data/backend-logs:/app/logs
    restart: always
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8085/api/health"]
      interval: 30s
      timeout: 10s
      retries: 5

networks:
  backend-network:
    driver: bridge
EOF

# Create environment file
cat > .env << EOF
DB_HOST=${db_host}
DB_NAME=${db_name}
DB_USERNAME=${db_username}
DB_PASSWORD=${db_password}
EOF

# Build and start backend
docker-compose -f docker-compose-backend.yml up -d

# Create a startup script for auto-restart
cat > /home/ec2-user/start-backend.sh << 'EOF'
#!/bin/bash
cd /home/ec2-user/app
docker-compose -f docker-compose-backend.yml up -d
EOF

chmod +x /home/ec2-user/start-backend.sh

# Add to crontab for startup
echo "@reboot /home/ec2-user/start-backend.sh" | crontab -u ec2-user -

# Log completion
echo "Backend setup completed at $(date)" >> /var/log/user-data.log