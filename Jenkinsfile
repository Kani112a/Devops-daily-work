pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops-nginx"
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME%:%IMAGE_TAG% ./docker"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat """
                kubectl set image deployment/nginx-deployment \
                nginx=%IMAGE_NAME%:%IMAGE_TAG%
                """
            }
        }
    }
}
