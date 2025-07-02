pipeline {
    agent any

    tools {
        maven 'Maven_3.6.3' // Add this Maven tool in Jenkins first
    }

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds-id'
        DOCKERHUB_USERNAME = 'devsandeepdockerhub'
        IMAGE_NAME = 'tomcat-webapp'
        GIT_REPO = 'https://github.com/dev-sandeep-git/docker-using-tomcat-.git'
        BRANCH = 'main'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${BRANCH}", credentialsId: 'github-token', url: "${GIT_REPO}"
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKERHUB_USERNAME}/${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', "${DOCKERHUB_CREDENTIALS}") {
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh '''
                    docker stop ${IMAGE_NAME} || true
                    docker rm ${IMAGE_NAME} || true
                    docker run -d --name ${IMAGE_NAME} -p 8080:8080 ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:latest
                    '''
                }
            }
        }
    }

    post {
        failure {
            echo "Build failed!"
        }
    }
}
