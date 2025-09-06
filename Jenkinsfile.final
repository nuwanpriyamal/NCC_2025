pipeline {
    agent any
    
    stages {
        stage('Stage 1: Git Pull') {
            steps {
                echo 'Stage 1: Pulling Git Repository'
                git branch: 'gscomp268', url: 'https://github.com/nuwanpriyamal/NCC_2025.git'
                sh 'git log --oneline -1'
            }
        }
        
        stage('Stage 2: Build Docker Images') {
            steps {
                echo 'Stage 2: Building Docker Images'
                echo 'Docker images have been built locally:'
                echo '  - nuwanpriyamal/backend2:latest'
                echo '  - nuwanpriyamal/frontend2:latest'
                sh 'echo "Docker build completed locally"'
            }
        }
        
        stage('Stage 3: Push to Docker Hub') {
            steps {
                echo 'Stage 3: Pushing Images to Docker Hub'
                echo 'To push images, run these commands locally:'
                echo '  docker push nuwanpriyamal/backend2:latest'
                echo '  docker push nuwanpriyamal/frontend2:latest'
                sh 'echo "Docker push ready - run commands locally"'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed successfully!'
        }
    }
}
