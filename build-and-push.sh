#!/bin/bash

# Docker Hub Build and Push Script
# This script builds and pushes Docker images to Docker Hub

set -e  # Exit on any error

# Configuration
DOCKER_USERNAME="nuwanpriyamal"
BACKEND_IMAGE="backend2"
FRONTEND_IMAGE="frontend2"
TAG="latest"

echo "🐳 Starting Docker build and push process..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker and try again."
    exit 1
fi

# Login to Docker Hub (user will be prompted for credentials)
echo "🔐 Logging into Docker Hub..."
docker login

# Build backend image
echo "🔨 Building backend image: $DOCKER_USERNAME/$BACKEND_IMAGE:$TAG"
docker build -t $DOCKER_USERNAME/$BACKEND_IMAGE:$TAG ./backend2

# Build frontend image
echo "🔨 Building frontend image: $DOCKER_USERNAME/$FRONTEND_IMAGE:$TAG"
docker build -t $DOCKER_USERNAME/$FRONTEND_IMAGE:$TAG ./frontend2

# Push backend image
echo "📤 Pushing backend image to Docker Hub..."
docker push $DOCKER_USERNAME/$BACKEND_IMAGE:$TAG

# Push frontend image
echo "📤 Pushing frontend image to Docker Hub..."
docker push $DOCKER_USERNAME/$FRONTEND_IMAGE:$TAG

echo "✅ Successfully built and pushed all images to Docker Hub!"
echo "📋 Images pushed:"
echo "   - $DOCKER_USERNAME/$BACKEND_IMAGE:$TAG"
echo "   - $DOCKER_USERNAME/$FRONTEND_IMAGE:$TAG"

# Optional: Test the images locally
echo "🧪 Testing images locally..."
docker-compose up -d
echo "🌐 Application is running at http://localhost:8080"
echo "🔧 Backend API available at http://localhost:5001/api/hello"
echo "⏹️  To stop the application, run: docker-compose down"