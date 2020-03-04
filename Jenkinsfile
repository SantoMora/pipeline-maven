pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh './jenkins/build/mvn.sh mvn -B -DskipTests clean package'
                sh './jenkins/build/build.sh'
            }
	    post {
	    	succes {
		    archiveArtifacs artifacs: 'java-app/target/*.jar', fingerprint: true
		}
	    }
        }
        stage('Test') {
            steps {
                sh './jenkins/test/test.sh mvn test'
            }
	    post {
		always {
		    junit 'java-app/target/surefire-reports/*.xml'
		}
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
