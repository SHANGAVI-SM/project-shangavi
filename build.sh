#!/bin/bash

# Define the Docker image name and tag
IMAGE_NAME="capstone-image"
TAG="latest"

# Define the path to the directory containing your Dockerfile
DOCKERFILE_DIR="C:\Users\koushalya\OneDrive\Desktop\project-shangavi"

# Build the Docker image
docker build -t "$IMAGE_NAME:$TAG" "$DOCKERFILE_DIR"

# Optionally, you can remove any dangling images to save disk space
docker image prune -f

