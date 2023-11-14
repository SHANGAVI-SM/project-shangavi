#!/bin/bash

# Check the Git branch
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u shangavism -p Darshiv@25

  
    # Tag the image
    docker tag capstone-image shangavism/dev

    # Push the image to the Dev Docker Hub repository
    docker push shangavism/dev

elif [[ $GIT_BRANCH == "origin/master" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u shangavism -p Darshiv@25

   
    # Tag the image
    docker tag capstone-image shangavism/prod 

    # Push the image to the Prod Docker Hub repository
    docker push shangavism/prod 
else
    echo "Deployment error"
fi
