pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Build stage'
                bat 'npm install'
                bat 'npm run build'
            }
        }
        stage('Test') {
            steps {
                echo 'Test the code'
                bat 'npm run lint'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Prepare the deployment release'
                bat 'npm ci --omit=dev'
                bat "docker build -t myapp-next:${env.BUILD_ID} ."
                echo 'Deploy the application to docker.'
                script {
                    try {
                        bat 'docker container stop this_is_my_container'
                        bat 'docker container rm this_is_my_container'
                    } catch (e) {
                        echo 'Cotainer not running'
                    }
                }
                bat "docker run -d --name this_is_my_container -p 3008:3005 myapp-next:${env.BUILD_ID} "
                }
            }
        }
    }
