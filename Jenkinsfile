pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops-nginx"
        IMAGE_TAG = "build-${BUILD_NUMBER}"   // unique tag for each build
        KUBE_DEPLOYMENT = "nginx-deployment"
        KUBE_CONTAINER = "nginx"
        MINIKUBE_DOCKER = "minikube"          // name for Minikube Docker env
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Use Minikube Docker') {
            steps {
                // This switches Docker CLI to use Minikube's Docker
                bat 'minikube -p minikube docker-env --shell cmd > minikube-env.bat'
                bat 'call minikube-env.bat'
                bat 'docker info'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ./docker"
            }
        }

        stage('Update Kubernetes Deployment') {
            steps {
                // Updates the deployment with the new image
                bat "kubectl set image deployment/${KUBE_DEPLOYMENT} ${KUBE_CONTAINER}=${IMAGE_NAME}:${IMAGE_TAG} --record"
                
                // Waits for rollout to finish
                bat "kubectl rollout status deployment/${KUBE_DEPLOYMENT}"
            }
        }

        stage('Verify Pods') {
            steps {
                bat "kubectl get pods"
            }
        }
    }
}
