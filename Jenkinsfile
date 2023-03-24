pipeline {
    agent any
    triggers {
        cron('*/15 * * * *')
    }
    stages {
        stage('pre-flight'){
            steps{
                sh "apt update "
                sh "apt-get --yes install nodejs npm"
            }
        }
        stage('Run service'){
            steps {
                dir('service/') {
                    sh "nohup java -Dproperties.location=application.properties -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=4000,suspend=n -jar sdet-assignment-service-0.0.1-SNAPSHOT.jar &"
                }
            }
        }
        stage('API test'){
            steps{
                dir('test/') {
                    sh 'npm install'
                    sh 'npm test'
                }
            }
        }
    }
    post {
        always {
            dir('test/') {
                script{
                    allure([
                        includeProperties: false,
                        jdk: '',
                        properties: [],
                        reportBuildPolicy: 'ALWAYS',
                        results: [[path: 'output']]
                    ])
                }
            }
        }
    }
}
