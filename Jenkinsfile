pipeline {
    agent {
        label 'server1-gelar'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/gelargilangg/simple-apps.git'
            }
        }
        stage('Build') {
            steps {
                sh '''cd apps
                npm install'''
            }
        }
        stage('Testing') {
            steps {
                sh '''cd apps
                npm test
                npm run test:coverage'''
            }
        }
        stage('Code Review') {
            steps {
                sh '''cd apps
                sonar-scanner \
                -Dsonar.projectKey=node-simple-apps \
                -Dsonar.sources=. \
                -Dsonar.host.url=http://172.23.14.103:9000 \
                -Dsonar.login=sqp_55d175ffb2b131229bd7e84dfc97a327d054cdbe'''
            }
        }
        stage('Deploy compose') {
            steps {
                sh '''
                docker compose build
                docker compose up -d
                '''
            }
        }
    }
}
