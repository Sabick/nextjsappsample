pipeline {
    agent any
     stages {
        stage('Build') { 
            steps { 
                echo "Build stage"
                sh 'npm install'
                sh 'npm run build'
                sh 'mkdir -p /Users/jithinscaria/Documents/Workshop/cloudframeworks/sample_apps/next-start-build'
                sh 'rm -r /Users/jithinscaria/Documents/Workshop/cloudframeworks/sample_apps/next-start-build/*'
                sh 'cp -r public .next package* /Users/jithinscaria/Documents/Workshop/cloudframeworks/sample_apps/next-start-build/'
                sh 'cd /Users/jithinscaria/Documents/Workshop/cloudframeworks/sample_apps/next-start-build/ && npm install --only=production'
            }
        }
        stage('Test'){
            steps {
                echo "Build Test"
                sh 'pwd && npm run lint'
            }
        }
        stage('Deploy') {
            steps {
                echo "Build Deploy"
                sh 'npm install -g pm2'
                sh 'pm2 stop cloudframeworks || echo "Not running"'
                sh '''cd /Users/jithinscaria/Documents/Workshop/cloudframeworks/sample_apps/next-start-build/ && 
                pm2 start npm --name cloudframeworks -- start '''
            }
        }
    }
}