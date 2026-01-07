pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-nginx:jenkins ./docker'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8085:80 devops-nginx:jenkins || true'
            }
        }
    }
}
























