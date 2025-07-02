pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-org/dev-sandeep-git.git'
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
