pipeline{
    agent any
    tools {
        maven 'Maven'
        jdk 'JDK17'
    }

    stages{
        stage('Checkout'){
            steps{
               checkout scm
            }
        }
         stage('Build and Run') {
            steps{
                script {
                    sh "docker compose -f docker-compose.yml up -d --build"
                }
            }
         }
    }

}