# NCC_2025 - Multi-Container Docker Application

This project contains a simple multi-container application with a Node.js backend and HTML frontend, containerized using Docker.

## Project Structure

```
NCC_2025/
├── backend2/           # Node.js Express backend
│   ├── Dockerfile
│   ├── package.json
│   ├── server.js
│   └── .dockerignore
├── frontend2/          # HTML frontend
│   ├── Dockerfile
│   └── index.html
├── docker-compose.yml  # Docker Compose configuration
└── README.md
```

## Docker Hub Setup Instructions

### Step 1: Create Docker Hub Repository
1. Go to [Docker Hub](https://hub.docker.com/)
2. Sign in to your account
3. Click "Create Repository"
4. Name it using your index number (e.g., `gscomp268-ncc2025`)
5. Set it to Public or Private as required
6. Click "Create"

### Step 2: Build and Push Images

Replace `YOUR_DOCKERHUB_USERNAME` and `YOUR_INDEX_NUMBER` with your actual Docker Hub username and index number.

```bash
# Build the images
docker build -t YOUR_DOCKERHUB_USERNAME/YOUR_INDEX_NUMBER-backend:latest ./backend2
docker build -t YOUR_DOCKERHUB_USERNAME/YOUR_INDEX_NUMBER-frontend:latest ./frontend2

# Login to Docker Hub
docker login

# Push the images
docker push YOUR_DOCKERHUB_USERNAME/YOUR_INDEX_NUMBER-backend:latest
docker push YOUR_DOCKERHUB_USERNAME/YOUR_INDEX_NUMBER-frontend:latest
```

## Running the Application

### Using Docker Compose (Recommended)
```bash
docker-compose up --build
```

### Using Docker commands
```bash
# Build and run backend
docker build -t backend2 ./backend2
docker run -d -p 5000:5000 --name backend2 backend2

# Build and run frontend
docker build -t frontend2 ./frontend2
docker run -d -p 80:80 --name frontend2 frontend2
```

## Accessing the Application

- Frontend: http://localhost
- Backend API: http://localhost:5000/api/hello

## Services

- **Backend**: Node.js Express server running on port 5000
- **Frontend**: Nginx serving HTML on port 80
- **Network**: Both services communicate via Docker network 
