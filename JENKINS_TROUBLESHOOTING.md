# Jenkins Pipeline Troubleshooting Guide

## Common Jenkins Pipeline Errors and Solutions

### 1. Groovy Compilation Errors

#### Error: "Expected a step @ line X, column Y"
**Problem**: Invalid Jenkins pipeline syntax
**Solution**: 
- Remove `currentBuild.result = 'FAILURE'` lines
- Use proper Jenkins pipeline steps only
- Check Jenkinsfile syntax with online validators

#### Error: "MultipleCompilationErrorsException"
**Problem**: Multiple syntax errors in Jenkinsfile
**Solution**:
- Use `Jenkinsfile.basic` for guaranteed working syntax
- Test with simple pipeline first
- Gradually add complexity

### 2. Docker-Related Errors

#### Error: "docker: command not found"
**Problem**: Docker not installed on Jenkins agent
**Solution**:
- Install Docker on Jenkins server
- Ensure Jenkins user has Docker permissions
- Add Jenkins user to docker group: `sudo usermod -aG docker jenkins`

#### Error: "Cannot connect to the Docker daemon"
**Problem**: Docker daemon not running or permission issues
**Solution**:
- Start Docker daemon: `sudo systemctl start docker`
- Check Docker status: `sudo systemctl status docker`
- Verify Jenkins user permissions

### 3. Credential Errors

#### Error: "Credentials not found"
**Problem**: Docker Hub credentials not configured
**Solution**:
1. Go to Jenkins → Manage Jenkins → Manage Credentials
2. Add new credentials:
   - Type: Username with password
   - Username: gscomp268
   - Password: Your Docker Hub password
   - ID: docker-hub-credentials

#### Error: "Authentication failed"
**Problem**: Wrong Docker Hub credentials
**Solution**:
- Verify username and password
- Use Docker Hub access token instead of password
- Check if account has repository permissions

### 4. Git-Related Errors

#### Error: "Repository not found"
**Problem**: Git repository URL incorrect or access denied
**Solution**:
- Verify repository URL in Jenkins job configuration
- Check if Jenkins has access to the repository
- Use HTTPS URL with credentials if needed

#### Error: "Branch not found"
**Problem**: Branch name incorrect
**Solution**:
- Check actual branch name: `git branch`
- Update Jenkins job configuration
- Use `*/main` or `*/master` for default branch

### 5. Build Environment Issues

#### Error: "Workspace not found"
**Problem**: Jenkins workspace not properly set up
**Solution**:
- Check "Delete workspace before build starts" option
- Ensure sufficient disk space
- Verify Jenkins agent is running

#### Error: "Permission denied"
**Problem**: File permission issues
**Solution**:
- Check file permissions: `ls -la`
- Ensure Jenkins user owns files: `sudo chown -R jenkins:jenkins /path/to/workspace`
- Verify directory permissions

## Recommended Jenkinsfile Versions

### 1. Jenkinsfile.basic (Recommended for Testing)
- Simple syntax, guaranteed to work
- Minimal error handling
- Easy to debug

### 2. Jenkinsfile.simple (Production Ready)
- Clean syntax with proper error handling
- Good balance of features and simplicity
- Recommended for most use cases

### 3. Jenkinsfile (Advanced)
- Full-featured with comprehensive error handling
- More complex but robust
- Use only if you need advanced features

## Step-by-Step Debugging Process

### 1. Test Basic Pipeline
```groovy
pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
```

### 2. Add Git Pull
```groovy
pipeline {
    agent any
    stages {
        stage('Git Pull') {
            steps {
                checkout scm
            }
        }
    }
}
```

### 3. Add Docker Build
```groovy
pipeline {
    agent any
    stages {
        stage('Git Pull') {
            steps {
                checkout scm
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t test:latest .'
            }
        }
    }
}
```

### 4. Add Docker Push
```groovy
pipeline {
    agent any
    stages {
        stage('Git Pull') {
            steps {
                checkout scm
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t gscomp268/test:latest .'
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    sh 'docker push gscomp268/test:latest'
                }
            }
        }
    }
}
```

## Quick Fixes

### 1. Replace Jenkinsfile
```bash
# Use the basic version
cp Jenkinsfile.basic Jenkinsfile
```

### 2. Test Docker Commands
```bash
# Test Docker build
docker build -t gscomp268/backend2:latest ./backend2

# Test Docker login
docker login -u gscomp268

# Test Docker push
docker push gscomp268/backend2:latest
```

### 3. Verify Jenkins Configuration
- Check Jenkins job configuration
- Verify repository URL and branch
- Confirm credential ID matches
- Test with simple pipeline first

## Getting Help

1. **Check Jenkins Console Output**: Look for specific error messages
2. **Test Commands Manually**: Run Docker commands in Jenkins workspace
3. **Use Basic Jenkinsfile**: Start with simplest working version
4. **Check Jenkins Logs**: Look at Jenkins system logs for detailed errors
5. **Verify Prerequisites**: Ensure all required plugins and tools are installed

## Success Indicators

✅ Pipeline runs without compilation errors
✅ Git pull completes successfully
✅ Docker images build without errors
✅ Docker push completes successfully
✅ All stages show "SUCCESS" status
