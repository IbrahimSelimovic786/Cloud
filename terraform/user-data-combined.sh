#!/bin/bash

# Install dependencies
yum update -y
yum install -y docker git
service docker start
usermod -a -G docker ec2-user

# Clone repositories
cd /home/ec2-user
git clone ${git_repo_url} Cloud
cd Cloud

# Start backend
cd backend
docker build -t backend-app .
docker run -d -p 8085:8085 -e SPRING_DATASOURCE_URL="jdbc:mysql://${db_host}/${db_name}?useSSL=false" \
  -e SPRING_DATASOURCE_USERNAME="${db_username}" \
  -e SPRING_DATASOURCE_PASSWORD="${db_password}" \
  -e APP_CLIENT_URL="http://${alb_dns_name}" \
  --name backend-container backend-app

# Start frontend
cd ../frontend
docker build -t frontend-app .
docker run -d -p 80:80 -e VUE_APP_API_BASE_URL="http://${alb_dns_name}/api" \
  --name frontend-container frontend-app

# Simple health check
cat > /home/ec2-user/health-check.sh <<'EOF'
#!/bin/bash
if docker ps | grep -q 'frontend-container' && docker ps | grep -q 'backend-container'; then
  exit 0
else
  exit 1
fi
EOF
chmod +x /home/ec2-user/health-check.sh

echo "Deployment completed at $(date)" >> /var/log/user-data.log