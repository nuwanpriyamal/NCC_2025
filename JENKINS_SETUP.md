# Jenkins Pipeline Setup Guide

This guide explains how to set up and configure the Jenkins pipeline for the NCC_2025 project.

## Prerequisites

1. **Jenkins Server** - Running Jenkins with Docker plugin installed
2. **Docker Hub Account** - With repository access
3. **Git Repository** - Forked repository with Jenkinsfile

## Required Jenkins Plugins

Ensure the following plugins are installed in Jenkins:

- **Docker Pipeline Plugin** - For Docker operations
- **Git Plugin** - For Git operations
- **Pipeline Plugin** - For pipeline support
- **Credentials Plugin** - For secure credential management

## Jenkins Pipeline Configuration

### 1. Create Docker Hub Credentials

1. Go to **Jenkins Dashboard** → **Manage Jenkins** → **Manage Credentials**
2. Select **System** → **Global credentials** → **Add Credentials**
3. Choose **Username with password**
4. Enter:
   - **Username**: `gscomp268` (your Docker Hub username)
   - **Password**: Your Docker Hub password or access token
   - **ID**: `docker-hub-credentials`
   - **Description**: `Docker Hub Credentials for gscomp268`

### 2. Create New Pipeline Job

1. Go to **Jenkins Dashboard** → **New Item**
2. Enter job name: `NCC_2025_Pipeline`
3. Select **Pipeline** → **OK**

### 3. Configure Pipeline

1. **Pipeline Definition**:
   - Select **Pipeline script from SCM**
   - **SCM**: Git
   - **Repository URL**: Your forked repository URL
   - **Branch**: `*/gscomp268` (or your branch name)
   - **Script Path**: `Jenkinsfile`

2. **Build Triggers** (Optional):
   - **GitHub hook trigger for GITScm polling** (if using GitHub)
   - **Poll SCM** with schedule: `H/5 * * * *` (every 5 minutes)

3. **Build Environment**:
   - Check **Delete workspace before build starts**

## Pipeline Stages

The Jenkinsfile defines three main stages:

### Stage 1: Git Pull
- Pulls the latest code from the repository
- Displays git information (branch, commit hash)
- Validates repository access

### Stage 2: Build Docker Images
- Builds backend Docker image (`gscomp268/backend2:latest`)
- Builds frontend Docker image (`gscomp268/frontend2:latest`)
- Validates image creation

### Stage 3: Push to Docker Hub
- Authenticates with Docker Hub using stored credentials
- Pushes both images to Docker Hub
- Validates successful push

## Environment Variables

The pipeline uses these environment variables:

- `DOCKER_HUB_CREDENTIALS`: Jenkins credential ID for Docker Hub
- `DOCKER_USERNAME`: Docker Hub username (`gscomp268`)
- `BACKEND_IMAGE`: Backend image name (`backend2`)
- `FRONTEND_IMAGE`: Frontend image name (`frontend2`)
- `TAG`: Image tag (`latest`)

## Manual Pipeline Execution

To run the pipeline manually:

1. Go to your pipeline job in Jenkins
2. Click **Build Now**
3. Monitor the build progress in the console output

## Troubleshooting

### Common Issues

1. **Docker Hub Authentication Failed**
   - Verify credentials are correctly configured
   - Check Docker Hub username and password/token

2. **Git Repository Access Denied**
   - Ensure Jenkins has access to the repository
   - Check repository URL and branch name

3. **Docker Build Failed**
   - Verify Dockerfile syntax
   - Check if Docker daemon is running
   - Ensure all required files are present

4. **Docker Push Failed**
   - Verify Docker Hub credentials
   - Check if repository exists on Docker Hub
   - Ensure proper permissions

### Logs and Debugging

- Check **Console Output** for detailed build logs
- Review **Stage View** for stage-specific information
- Use **Blue Ocean** for visual pipeline representation

## Security Considerations

1. **Credentials Management**
   - Use Jenkins credential store for sensitive data
   - Never hardcode passwords in Jenkinsfile
   - Use Docker Hub access tokens instead of passwords

2. **Repository Access**
   - Use SSH keys for Git access when possible
   - Limit Jenkins user permissions to necessary repositories

## Pipeline Monitoring

- **Build History**: Track pipeline execution history
- **Build Status**: Monitor success/failure rates
- **Console Output**: Detailed logs for debugging
- **Artifacts**: Docker images pushed to Docker Hub

## Integration with Docker Hub

After successful pipeline execution, images will be available at:

- **Backend**: `https://hub.docker.com/r/gscomp268/backend2`
- **Frontend**: `https://hub.docker.com/r/gscomp268/frontend2`

## Next Steps

1. Configure webhook for automatic builds on code changes
2. Set up notification system for build status
3. Implement additional testing stages
4. Add deployment automation
