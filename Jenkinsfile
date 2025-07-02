pipeline {
    agent any

    tools {
        maven 'Maven_3.6.3' // Add this Maven tool in Jenkins first
    }

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds-id'
        DOCKERHUB_USERNAME = 'sandeep257
        IMAGE_NAME = 'tomcat'
        GIT_REPO = 'https://github.com/dev-sandeep-git/docker-using-tomcat-.git'
        BRANCH = 'main'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dev-sandeep-git/docker-using-tomcat-.git'
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
                    dockerImage = docker.build("$sandeep257/$tomcat:latest")
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
                    docker stop ${tomcat} || true
                    docker rm ${IMAGE_NAME} || true
                    docker run -d --name ${tomcat} -p 8080:8080 ${sandeep257}/$tomcat:latest
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
