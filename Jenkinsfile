pipeline {
    agent any
    
    environment {
        DOCKER_USERNAME = 'nuwanpriyamal'
    }
    
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
                sh 'docker build -t nuwanpriyamal/backend2:latest ./backend2'
                sh 'docker build -t nuwanpriyamal/frontend2:latest ./frontend2'
            }
        }
        
        stage('Stage 3: Push to Docker Hub') {
            steps {
                echo 'Stage 3: Pushing Images to Docker Hub'
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    sh 'docker push nuwanpriyamal/backend2:latest'
                    sh 'docker push nuwanpriyamal/frontend2:latest'
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
