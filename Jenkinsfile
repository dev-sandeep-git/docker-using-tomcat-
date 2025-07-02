pipeline {
    agent any
    tools {
        maven 'Maven_3.9'
    }

    stages {
        stage('Checkout') {
            steps {
              git branch: 'main', url: 'https://github.com/dev-sandeep-git/docker-using-tomcat-.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh 'chmod +x install-tomcat.sh'
                sh './install-tomcat.sh'
            }
        }
    }
}
