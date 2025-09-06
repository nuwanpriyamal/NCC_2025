#!/bin/bash

# Build and Push Script for Docker Hub
# Replace these variables with your actual Docker Hub username and index number
DOCKERHUB_USERNAME="nuwanpriyamal"
INDEX_NUMBER="gscomp268"

echo "Building Docker images..."

# Build backend image
echo "Building backend image..."
docker build -t ${DOCKERHUB_USERNAME}/${INDEX_NUMBER}-backend:latest ./backend2

# Build frontend image
echo "Building frontend image..."
docker build -t ${DOCKERHUB_USERNAME}/${INDEX_NUMBER}-frontend:latest ./frontend2

echo "Images built successfully!"
echo ""
echo "To push to Docker Hub, run:"
echo "docker login"
echo "docker push ${DOCKERHUB_USERNAME}/${INDEX_NUMBER}-backend:latest"
echo "docker push ${DOCKERHUB_USERNAME}/${INDEX_NUMBER}-frontend:latest"
echo ""
echo "Or run this script with 'push' argument:"
echo "./build-and-push.sh push"

if [ "$1" = "push" ]; then
    echo "Pushing images to Docker Hub..."
    docker push ${DOCKERHUB_USERNAME}/${INDEX_NUMBER}-backend:latest
    docker push ${DOCKERHUB_USERNAME}/${INDEX_NUMBER}-frontend:latest
    echo "Images pushed successfully!"
fi
