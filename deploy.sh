#!/bin/bash

# Define the Docker image name and tag
IMAGE_NAME="capstone-image"
TAG="latest"

# Define the container name
CONTAINER_NAME="capstone_container"

# Define the port mappings (host_port:container_port)
PORT_MAPPING="80:8080"

# Define any environment variables
ENV_VARS="-e DB_HOST=mydbhost -e DB_USER=mydbuser"

# Stop and remove any existing container with the same name
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# Run the Docker container
docker run -d --name $CONTAINER_NAME -p $PORT_MAPPING $ENV_VARS $IMAGE_NAME:$TAG

# Optional: View the container logs
docker logs $CONTAINER_NAME
