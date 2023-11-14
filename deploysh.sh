#!/bin/bash

# Set your AWS credentials and region
export AWS_ACCESS_KEY_ID="aws_access_key_id"
export AWS_SECRET_ACCESS_KEY="aws_secret_access_key"
export AWS_DEFAULT_REGION="region"

# Set your Docker image details
DOCKER_IMAGE="capstoneproject:latest"

#  Pull the latest Docker image
echo "Pulling the latest Docker image..."
docker pull $DOCKER_IMAGE

# Stop and remove the existing container (if any)
echo "Stopping and removing existing container..."
docker stop shangavi && docker rm shangavi

# Run the new container
echo "Starting the new Docker container..."
docker run -d --name shangavi -p 80:80 $DOCKER_IMAGE

echo "Deployment complete!"
