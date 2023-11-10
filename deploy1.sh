#!/bin/bash

# Define variables
dockerImageName="capstone-image"
dockerImageTag="latest"
CONTAINER_NAME="shangavi"
AWS_REGION="ap-south-1"
AWS_ACCESS_KEY="awsconsole"
AWS_SECRET_KEY="aws-key"

# Log in to your Docker registry (if needed)
# docker login -u your-docker-username -p your-docker-password

# Pull the latest Docker image
docker pull "$dockerImageName":"$dockerImageTag"

# Stop the existing container (if running)
if docker ps | grep -q $CONTAINER_NAME; then
  docker stop $CONTAINER_NAME
  docker rm $CONTAINER_NAME
fi

# Run the new container
docker run -d --name $CONTAINER_NAME -p 80:80 "$dockerImageName":"$dockerImageTag"

# Clean up unused Docker images and containers
docker system prune -af


echo "Deployment completed successfully."
