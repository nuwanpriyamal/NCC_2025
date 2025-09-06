# Docker Jenkins Fix Guide

## Problem Solved: Git ✅
- ✅ Jenkins is now pulling from correct repository
- ✅ Branch `gscomp268` is working
- ✅ All files are available

## New Problem: Docker Not Found ❌
- ❌ `docker: command not found`
- ❌ Docker not installed on Jenkins server

## Solutions

### Option 1: Install Docker on Jenkins Server

**If Jenkins is running on your local machine:**

```bash
# Install Docker (macOS)
brew install docker
brew services start docker

# Verify installation
docker --version
docker info
```

**If Jenkins is running on Linux server:**

```bash
# Install Docker
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Add Jenkins user to docker group
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

### Option 2: Use Docker-in-Docker Agent

**Update Jenkinsfile to use Docker agent:**

```groovy
pipeline {
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    // ... rest of pipeline
}
```

### Option 3: Test Without Docker

**Use the no-docker version to test pipeline structure:**

```bash
# Replace Jenkinsfile with no-docker version
cp Jenkinsfile.no-docker Jenkinsfile
git add .
git commit -m "Add no-docker test version"
git push origin gscomp268
```

### Option 4: Run Docker Commands Manually

**Test Docker locally first:**

```bash
# Test Docker build
docker build -t nuwanpriyamal/backend2:latest ./backend2
docker build -t nuwanpriyamal/frontend2:latest ./frontend2

# Test Docker push (after creating repositories on Docker Hub)
docker push nuwanpriyamal/backend2:latest
docker push nuwanpriyamal/frontend2:latest
```

## Recommended Steps

### 1. Install Docker on Jenkins Server
```bash
# Check if Docker is installed
which docker
docker --version

# If not installed, install it
brew install docker  # macOS
# or
sudo apt install docker.io  # Linux

# Start Docker service
brew services start docker  # macOS
# or
sudo systemctl start docker  # Linux
```

### 2. Test Docker Installation
```bash
# Test Docker
docker run hello-world

# Test Docker build
docker build -t test:latest .
```

### 3. Update Jenkins Job
- Use the original Jenkinsfile (it should work now)
- Or use `Jenkinsfile.docker-agent` for Docker-in-Docker

### 4. Run Pipeline Again
- The pipeline should now work through all stages

## Current Status

✅ **Stage 1: Git Pull** - WORKING  
❌ **Stage 2: Build Docker Images** - Docker not found  
⏭️ **Stage 3: Push to Docker Hub** - Skipped due to failure  

## Next Steps

1. **Install Docker** on Jenkins server
2. **Test Docker** installation
3. **Run pipeline** again
4. **Create Docker Hub repositories** (if not done yet)

The pipeline structure is perfect - just need Docker installed! 🐳
