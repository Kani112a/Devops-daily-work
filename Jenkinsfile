pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t devops-nginx:jenkins ./docker'
            }
        }

        stage('Run Container') {
            steps {
                bat '''
                docker stop devops-nginx-container || exit 0
                docker rm devops-nginx-container || exit 0
                docker run -d --name devops-nginx-container -p 8085:80 devops-nginx:jenkins
                '''
            }
        }
    }
}









































