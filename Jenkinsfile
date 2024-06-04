pipeline{
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
        APP_IMAGE = 'spygram/mavjendock'
        IMAGE_TAG = 'latest'
    }
    stages{
        stage("git checkout"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GithubCredential', url: 'https://github.com/Spygram/mavjendock.git']])
            }

        }
        
        stage("Maven Build"){
            steps{
                    sh "mvn clean package" 
                    
            }
        }
        
        stage("build docker image"){
            steps{
                sh "docker compose up -d --build"
            }
        }
        
        stage("Push maven Image") {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-credentials-id') {
                        sh 'docker push $APP_IMAGE:$IMAGE_TAG'
                    }
                }
            }
        }
    }    

    post {
        always {
            cleanWs()
        }
    }
}
