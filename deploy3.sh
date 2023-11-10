#!/bin/bash

# Variables
AWS_KEY_PAIR="keyforall"
AWS_INSTANCE_IP="15.206.94.151"
dockerImageName="capstone-image"
dockerImageTag="latest"
DOCKER_CONTAINER_NAME="shangavi"

#step:1 Pull the latest Docker image
docker pull "$dockerImageName":"$dockerImageTag"

# Step 2: Save Docker image as a tar file
docker save -o image.tar $dockerImageName:$dockerImageTag

# Step 3: Copy Docker image to EC2 instance
scp -i ~/.ssh/$AWS_KEY_PAIR.pem image.tar ec2-user@$AWS_INSTANCE_IP:~/image.tar

# Step 4: Connect to EC2 instance and load Docker image
ssh -i ~/.ssh/$AWS_KEY_PAIR.pem ec2-user@$AWS_INSTANCE_IP << EOF
    docker load -i ~/image.tar
EOF

# Step 5: Run Docker container on EC2 instance
ssh -i ~/.ssh/$AWS_KEY_PAIR.pem ec2-user@$AWS_INSTANCE_IP << EOF
    docker run -d --name $DOCKER_CONTAINER_NAME -p 80:80 $dockerImageName:$dockerImageTag
EOF

# Cleanup: Remove local tar file
rm image.tar

echo "Deployment completed successfully."
