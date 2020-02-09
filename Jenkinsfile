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
                withAWS(region: 'us-west-2', credentials: 'aws'){
                    sh 'aws --version'
                    sh 'aws eks --region us-west-2 update-kubeconfig --name EKS-yw98RNVzWIlC'
                    sh 'kubectl create deployment happy-sitess --image=xia0m/happy-site:latest'
                    sh 'kubectl apply -f aws-auth-cm.yaml'
                    sh 'kubectl apply -f Deploy/Deployment.yaml'
                    sh 'kubectl get nodes'
                    sh 'kubectl get pods'
                }
            }
        }
        stage('Rolling Update'){
            steps{
                withAWS(region: 'us-west-2', credentials: 'aws'){
                    sh "echo future version"
                    // sh 'kubectl set image deployment/happy-sites happy-sites=xia0m/happy-site:v2
                    sh 'kubectl rollout status -w deployment/happy-sites'
                }
            }
        }
    }

}