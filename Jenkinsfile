pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh './jenkins/build/mvn.sh mvn -B -DskipTests clean package'
                sh './jenkins/build/build.sh'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/test/test.sh mvn test'
            }
        }
        stage('Push') {
            steps {
                sh 'jenkins/push/push.sh'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo Deploy'
		sh 'jenkins/deploy/deploy.sh'
            }
        }

    }
}
