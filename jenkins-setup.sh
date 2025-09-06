#!/bin/bash

# Jenkins Pipeline Setup Script
# This script helps set up the Jenkins pipeline for the NCC_2025 project

echo "🚀 Jenkins Pipeline Setup for NCC_2025"
echo "======================================"

# Check if Jenkins is running
echo "🔍 Checking Jenkins status..."
if curl -s http://localhost:8080 > /dev/null 2>&1; then
    echo "✅ Jenkins is running on http://localhost:8080"
else
    echo "❌ Jenkins is not running. Please start Jenkins first."
    echo "   You can start Jenkins with: docker run -p 8080:8080 jenkins/jenkins:lts"
    exit 1
fi

# Display setup instructions
echo ""
echo "📋 Manual Setup Steps:"
echo "======================"
echo ""
echo "1. 🔐 Configure Docker Hub Credentials:"
echo "   - Go to: http://localhost:8080/credentials/store/system/domain/_/"
echo "   - Click 'Add Credentials'"
echo "   - Type: Username with password"
echo "   - Username: gscomp268"
echo "   - Password: [Your Docker Hub password]"
echo "   - ID: docker-hub-credentials"
echo ""
echo "2. 🏗️ Create Pipeline Job:"
echo "   - Go to: http://localhost:8080/newJob"
echo "   - Name: NCC_2025_Pipeline"
echo "   - Type: Pipeline"
echo "   - Click OK"
echo ""
echo "3. ⚙️ Configure Pipeline:"
echo "   - Pipeline definition: Pipeline script from SCM"
echo "   - SCM: Git"
echo "   - Repository URL: [Your forked repository URL]"
echo "   - Branch: */gscomp268"
echo "   - Script Path: Jenkinsfile"
echo ""
echo "4. ▶️ Run Pipeline:"
echo "   - Click 'Build Now'"
echo "   - Monitor progress in console output"
echo ""

# Check if required files exist
echo "📁 Checking required files..."
if [ -f "Jenkinsfile" ]; then
    echo "✅ Jenkinsfile found"
else
    echo "❌ Jenkinsfile not found"
fi

if [ -f "docker-compose.yml" ]; then
    echo "✅ docker-compose.yml found"
else
    echo "❌ docker-compose.yml not found"
fi

if [ -f "backend2/Dockerfile" ]; then
    echo "✅ backend2/Dockerfile found"
else
    echo "❌ backend2/Dockerfile not found"
fi

if [ -f "frontend2/Dockerfile" ]; then
    echo "✅ frontend2/Dockerfile found"
else
    echo "❌ frontend2/Dockerfile not found"
fi

echo ""
echo "🎯 Pipeline Stages:"
echo "==================="
echo "1. Git Pull - Pulls latest code from repository"
echo "2. Build Docker Images - Builds backend2 and frontend2 images"
echo "3. Push to Docker Hub - Pushes images to gscomp268 repository"
echo ""

echo "🔗 Useful Links:"
echo "================"
echo "Jenkins Dashboard: http://localhost:8080"
echo "Docker Hub: https://hub.docker.com/r/gscomp268"
echo ""

echo "✅ Setup instructions complete!"
echo "Follow the manual steps above to configure Jenkins."
