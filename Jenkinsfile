pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials-id' // Replace this with your Jenkins credential ID
        DOCKER_IMAGE = 'hemanth3103/cloudlab'  // Replace 'yourdockerhubusername/yourimagename' with your real DockerHub repo
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/hemanth3103/cloudlab'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }
        
        stage('Docker Hub Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_HUB_CREDENTIALS}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    bat 'echo %PASSWORD% | docker login -u %USERNAME% --password-stdin'
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}:latest").push()
                }
            }
        }
        
        stage('Docker Logout') {
            steps {
                bat 'docker logout'
            }
        }
    }
}
