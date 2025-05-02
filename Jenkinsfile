pipeline {
    agent any

    tools {
        maven 'Maven 3.8.1'
    }

    environment {
        DOCKER_IMAGE = "laksh2004/sample-java-app:${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/la2951/sample-java-app.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-creds', url: 'https://index.docker.io/v1/']) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl set image deployment/sample-app-deployment sample-container=$DOCKER_IMAGE'
            }
        }
    }
}

