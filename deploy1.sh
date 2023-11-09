#!/bin/bash

# Configuration
EC2_INSTANCE_IP="65.0.133.87"   
DOCKER_IMAGE_NAME="capstone-image"    
DOCKER_CONTAINER_NAME="shangavi"    
DOCKER_PORT_MAPPING="-p 80:80" 
YOUR_KEY_PAIR="keyforall"
      
# SSH into the EC2 instance and update it
ssh -i "$YOUR_KEY_PAIR.pem" ec2-user@$EC2_INSTANCE_IP << EOF
  sudo yum update -y
EOF

# Pull the latest Docker image from your Docker registry
ssh -i "$YOUR_KEY_PAIR.pem" ec2-user@$EC2_INSTANCE_IP << EOF
  docker pull $DOCKER_IMAGE_NAME
EOF

# Stop and remove the existing Docker container (if it exists)
ssh -i "$YOUR_KEY_PAIR.pem" ec2-user@$EC2_INSTANCE_IP << EOF

  docker stop $DOCKER_CONTAINER_NAME
  docker rm $DOCKER_CONTAINER_NAME
EOF

# Run the new Docker container
ssh -i "$YOUR_KEY_PAIR.pem" ec2-user@$EC2_INSTANCE_IP << EOF
  docker run -d --name $DOCKER_CONTAINER_NAME $DOCKER_PORT_MAPPING $DOCKER_IMAGE_NAME
EOF

echo "Deployment completed."
