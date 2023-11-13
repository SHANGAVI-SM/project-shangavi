#!/bin/bash

# Set your AWS credentials and region
export AWS_ACCESS_KEY_ID="aws_access_key_id"
export AWS_SECRET_ACCESS_KEY="aws_secret_access_key"
export AWS_DEFAULT_REGION="region"

# Set your Docker image details
DOCKER_IMAGE="capstoneproject:latest"
EC2_INSTANCE_IP="15.206.94.151"
EC2_INSTANCE_USER="ubuntu"
PRIVATE_KEY_PATH="/c/Users/koushalya/Downloads/keyforall.pem"  

# Connect to the EC2 instance
echo "Connecting to EC2 instance..."
ssh -i "$PRIVATE_KEY_PATH" $EC2_INSTANCE_USER@$EC2_INSTANCE_IP << EOF

#  Pull the latest Docker image
echo "Pulling the latest Docker image..."
docker pull $DOCKER_IMAGE

# Stop and remove the existing container (if any)
echo "Stopping and removing existing container..."
docker stop shangavi && docker rm shangavi

# Run the new container
echo "Starting the new Docker container..."
docker run -d --name shangavi -p 80:80 $DOCKER_IMAGE

EOF

echo "Deployment complete!"
