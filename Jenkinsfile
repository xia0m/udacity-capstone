pipeline {
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

    }

}