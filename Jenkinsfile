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
// 	stage('File transfer into minikube server') {
//             steps {
// 	        sh 'scp -r /var/lib/jenkins/workspace/jenkins-docker/* ubuntu@172.31.17.56:/home/ubuntu/project'
// 			}		
// 	} 
// 	stage('Login into minikube server and run helm chart') {
//             steps {
// 	    sh """
	    
//  	    ssh ubuntu@172.31.17.56 << EOF
//        	    cd project
//             helm install "rutu-$BUILD_NUMBER" demochart
// 	    exit
// 	    << EOF
// 	    """
// 			}
// 		}
    }

}

