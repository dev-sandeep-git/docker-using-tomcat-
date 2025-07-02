pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-user/dev-sandeep-git.git'
            }
        }

        stage('Build and Deploy Tomcat') {
            steps {
                sh 'chmod +x install-tomcat.sh'
                sh './install-tomcat.sh'
            }
        }
    }
}
