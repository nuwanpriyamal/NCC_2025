# Docker Hub Deployment Guide

This project contains a multi-container application with a Node.js backend and a static HTML frontend.

## Docker Images

The following images are available on Docker Hub:

- **Backend**: `gscomp268/backend2:latest`
- **Frontend**: `gscomp268/frontend2:latest`

## Quick Start

### Using Docker Compose (Recommended)

1. Clone the repository:
```bash
git clone <your-repo-url>
cd NCC_2025
```

2. Run the application:
```bash
docker-compose up -d
```

3. Access the application:
- Frontend: http://localhost:8080
- Backend API: http://localhost:5001/api/hello

### Using Docker Commands

1. Pull the images:
```bash
docker pull gscomp268/backend2:latest
docker pull gscomp268/frontend2:latest
```

2. Create a network:
```bash
docker network create app-network
```

3. Run the backend:
```bash
docker run -d --name backend2 --network app-network -p 5001:5000 gscomp268/backend2:latest
```

4. Run the frontend:
```bash
docker run -d --name frontend2 --network app-network -p 8080:80 gscomp268/frontend2:latest
```

## Building and Pushing Images

To build and push the images to Docker Hub:

1. Make sure you're logged into Docker Hub:
```bash
docker login
```

2. Run the build script:
```bash
./build-and-push.sh
```

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
├── build-and-push.sh
└── DOCKER_DEPLOYMENT.md
```

## API Endpoints

- `GET /api/hello` - Returns a simple hello message from the backend

## Stopping the Application

To stop the application:
```bash
docker-compose down
```

Or if running with individual Docker commands:
```bash
docker stop frontend2 backend2
docker rm frontend2 backend2
```
