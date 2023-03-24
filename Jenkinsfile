pipeline {
    agent {
        docker { image 'node:119' }
    }
    stages {
        stage('API test'){
            steps {
                sh "rm -f -R allure-results"
                sh "mkdir allure-results"
                sh 'npm install'
                sh 'npm test'
                }
            }
        stage('Process build') {
            steps {
                script{
                    def  FILES_LIST = sh (script: "ls allure-results/", returnStdout: true).trim()
                    echo "FILES_LIST : ${FILES_LIST}"
                    def parsedfiles = FILES_LIST.split(" ")
                    echo "${parsedfiles}"
                    if ("${env.CAUSE}".contains("Triggered by job")){
                        def data = readJSON file:'dummy.json'
                        def quit = httpRequest url:"${returnurl}", httpMode: 'POST', contentType: 'TEXT_PLAIN', requestBody:"${data}"
                    }else{
                        println("Local execution")
                    }
                    allure([
                        includeProperties: false,
                        jdk: '',
                        properties: [],
                        reportBuildPolicy: 'ALWAYS',
                        results: [[path: 'allure-results']]
                    ])
                }
            }
        }
    }
}
