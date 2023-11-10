#!/bin/bash

# AWS EC2 Instance Details
INSTANCE_USER="ubuntu"
INSTANCE_IP="15.206.94.151"
INSTANCE_SSH_KEY=credentials('key-private')

# Docker Image Details
dockerImageName="capstone-image"
dockerImageTag="latest"
DOCKER_CONTAINER_NAME="shangavi"


# Connect to EC2 instance
ssh -o StrictHostKeyChecking=no -i "$INSTANCE_SSH_KEY" "$INSTANCE_USER"@"$INSTANCE_IP" << EOF

sudo apt-get update 

# Pull the latest Docker image
docker pull "$dockerImageName":"$dockerImageTag"

# Stop and remove the existing container (if any)

  docker stop $DOCKER_CONTAINER_NAME
  docker rm $DOCKER_CONTAINER_NAME

# Run the new Docker container
docker run -d --name "$DOCKER_CONTAINER_NAME" -p 80:80 "$dockerImageName":"$dockerImageTag"

# Clean up unused Docker images and containers
docker image prune -f
docker container prune -f

EOF

echo "Deployment completed successfully."