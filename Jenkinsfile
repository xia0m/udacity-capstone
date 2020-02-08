pipeline {
    environment {
        registry = 'xia0m/static_website'
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
                sh 'docker build --tag=xia0m/hello-site .'
            }
        }
        stage('Publish Docker Image') {
            steps {
                withDockerRegistry([credentialsId:'dockerhub',url:'']){
                    sh 'docker push xia0m/hello-site'
                }
            }
        }
        stage('Deploy Hello-Site to AWS EKS'){
            steps {
                withAWS(region: 'us-west-2', credentials: '890282704991'){
                    sh 'aws eks --region us-west-2 update-kubeconfig --name EKS-iqwfLWjiW3NW'
                    sh 'kubectl apply -f aws-auth-cm.yaml'
                    sh 'kubectl apply -f Deploy/blue.yaml'
                }
            }
        }

    }

}