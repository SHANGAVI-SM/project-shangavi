#!/bin/bash

# Define variables
dockerImageName="capstone-image"
dockerImageTag="latest"

# Create a Docker image
docker build -t $dockerImageName:$dockerImageTag .

# Print a message when the build is complete
echo "Docker image $dockerImageName:$dockerImageTag is ready."