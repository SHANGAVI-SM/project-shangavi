#!/bin/bash

# Print debug information
echo "Branch: $GIT_BRANCH"
echo "Commit: $GIT_COMMIT"

# Extract branch name from GIT_BRANCH
BRANCH_NAME=$(echo "$GIT_BRANCH" | awk -F'/' '{print $NF}')
export BRANCH_NAME

# Docker login
docker login -u shangavism -p Darshiv@25

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