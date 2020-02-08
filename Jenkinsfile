pipeline {
    environment {
        registry = 'xia0m/static_website',
        registryCredential = 'dockerhub'
    }
    agent any
    stages {
        stage('Lint HTML') {
            steps {
                sh 'tidy -q -e udacity/*.html'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build --tag=hello-site .'
            }
        }
        stage('Publish Docker Image') {
            steps {
                withDockerRegistry([credentialsId:'dockerhub',url:'']){
                    sh 'docker push xia0m/static_website'
                }
            }
        }

    }

}