pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('DOCKER_HUB_LOGIN')
	}
    stages {
        
       stage('Build') {

			steps {
				sh 'docker build -t darshanrami/rdrep:latest .'
			}
		}

	stage('Login') {

		steps {
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
		}
	}

	stage('Push') {

		steps {
			sh 'docker push darshanrami/rdrep:latest'
		}
	}
	    
	stage('File transfer into minikube server') {
            steps {
	        sh 'scp -r /var/lib/jenkins/workspace/dev-assess/demochart ubuntu@172.31.40.23:/home/ubuntu/project'
			}		
	}   
	    
	stage('Login into minikube server and run helm chart') {
            steps {
	    sh """
	    
 	    ssh ubuntu@172.31.40.23 << EOF
       	    cd project
            helm install "darshan-$BUILD_NUMBER" demochart
	    exit
	    << EOF
	    """
			}
		}    
	    
    }

}

