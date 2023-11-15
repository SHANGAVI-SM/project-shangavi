#!/bin/bash

# Print the environment variables for debugging
echo "Environment variables:"
env

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
export BRANCH_NAME

# Docker login
docker login -u shangavism -p Darshiv@25

# Debugging: Print the value of BRANCH_NAME


# Check the Jenkins environment variable for Git branch
if [[ $BRANCH_NAME == "dev" ]]; then
    # Build and start your project in dev mode
    docker-compose -f docker-compose-dev.yml up -d

elif [[ $BRANCH_NAME == "master" ]]; then
    # Build and start your project in prod mode
    docker-compose -f docker-compose-prod.yml up -d

else
    echo "Deployment error: Unknown branch"
fi



