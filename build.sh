#!/bin/bash

# Define variables
dockerImageName="capstone-image"
dockerImageTag="latest"

# Build the React application
npm install
npm audit fix --force
npm run build

# Create a Docker image
docker build -t $dockerImageName:$dockerImageTag .

# Clean up - remove the local build artifacts if you want
rm -rf build

# Optionally, you can remove any dangling images to save disk space
docker image prune -f

# Print a message when the build is complete
echo "Docker image $dockerImageName:$dockerImageTag is ready."