# NCC_2025 - Multi-Container Application with CI/CD

This project demonstrates a complete CI/CD pipeline using Docker, Docker Hub, and Jenkins for a multi-container application.

## Project Overview

- **Backend**: Node.js Express API server
- **Frontend**: Static HTML with JavaScript
- **Containerization**: Docker with multi-container setup
- **CI/CD**: Jenkins pipeline with automated build and deployment
- **Registry**: Docker Hub for image storage

## Project Structure

```
NCC_2025/
├── backend2/
│   ├── Dockerfile
│   ├── .dockerignore
│   ├── package.json
│   └── server.js
├── frontend2/
│   ├── Dockerfile
│   ├── .dockerignore
│   └── index.html
├── docker-compose.yml
├── Jenkinsfile
├── Jenkinsfile.simple
├── build-and-push.sh
├── jenkins-setup.sh
├── DOCKER_DEPLOYMENT.md
├── JENKINS_SETUP.md
└── README.md
```

## Quick Start

### 1. Clone and Setup
```bash
git clone <your-repo-url>
cd NCC_2025
```

### 2. Run with Docker Compose
```bash
docker-compose up -d
```

### 3. Access Application
- **Frontend**: http://localhost:8080
- **Backend API**: http://localhost:5001/api/hello

## Docker Hub Images

Images are available on Docker Hub:
- **Backend**: `gscomp268/backend2:latest`
- **Frontend**: `gscomp268/frontend2:latest`

### Pull and Run Images
```bash
# Pull images
docker pull gscomp268/backend2:latest
docker pull gscomp268/frontend2:latest

# Run with Docker Compose
docker-compose up -d
```

## Jenkins CI/CD Pipeline

### Pipeline Stages

1. **Stage 1: Git Pull**
   - Pulls latest code from repository
   - Displays git information

2. **Stage 2: Build Docker Images**
   - Builds backend Docker image
   - Builds frontend Docker image

3. **Stage 3: Push to Docker Hub**
   - Authenticates with Docker Hub
   - Pushes both images to registry

### Jenkins Setup

1. **Prerequisites**
   - Jenkins server running
   - Docker Hub account
   - Required Jenkins plugins installed

2. **Quick Setup**
   ```bash
   ./jenkins-setup.sh
   ```

3. **Manual Setup**
   - Follow instructions in `JENKINS_SETUP.md`
   - Configure Docker Hub credentials
   - Create pipeline job with Jenkinsfile

### Jenkinsfile Options

- **`Jenkinsfile`** - Full-featured pipeline with error handling
- **`Jenkinsfile.simple`** - Simplified version for basic setup

## API Endpoints

- `GET /api/hello` - Returns hello message from backend

## Development

### Local Development
```bash
# Backend
cd backend2
npm install
npm start

# Frontend
# Open frontend2/index.html in browser
```

### Docker Development
```bash
# Build images
docker build -t gscomp268/backend2:latest ./backend2
docker build -t gscomp268/frontend2:latest ./frontend2

# Run with Docker Compose
docker-compose up -d
```

## Deployment

### Manual Deployment
```bash
# Build and push to Docker Hub
./build-and-push.sh
```

### Automated Deployment
- Configure Jenkins pipeline
- Push code to trigger automatic build
- Images automatically pushed to Docker Hub

## Configuration

### Environment Variables
- `DOCKER_USERNAME`: Docker Hub username (gscomp268)
- `NODE_ENV`: Node.js environment (production)

### Ports
- **Frontend**: 8080 (host) → 80 (container)
- **Backend**: 5001 (host) → 5000 (container)

## Troubleshooting

### Common Issues

1. **Port Conflicts**
   - Change ports in `docker-compose.yml`
   - Check for running services on ports 80, 5000

2. **Docker Hub Authentication**
   - Verify credentials in Jenkins
   - Check Docker Hub repository permissions

3. **Jenkins Pipeline Failures**
   - Check console output for errors
   - Verify Docker daemon is running
   - Ensure all required files are present

### Logs and Debugging
```bash
# Docker Compose logs
docker-compose logs

# Individual container logs
docker logs backend2
docker logs frontend2

# Jenkins console output
# Check Jenkins job console output
```

## Security Considerations

- Use Jenkins credential store for sensitive data
- Never hardcode passwords in configuration files
- Use Docker Hub access tokens instead of passwords
- Limit Jenkins user permissions

## Monitoring

- **Docker Hub**: Monitor image pushes and pulls
- **Jenkins**: Track build history and success rates
- **Application**: Monitor container health and logs

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes
4. Test with Docker Compose
5. Submit pull request

## License

This project is part of the NCC_2025 assignment.

## Support

For issues and questions:
- Check troubleshooting section
- Review Jenkins and Docker logs
- Consult documentation files