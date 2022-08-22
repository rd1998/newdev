pipeline {
    agent any
    tools {
        maven 'MAVEN'
    }
    stages {
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t slkrt2211/testrepo .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'slkrt2211', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u slkrt2211 -p ${dockerhubpwd}'
}
                    sh 'docker push slkrt2211/testrepo'
                }
            }
        }
	stage('File transfer into minikube server') {
            steps {
	        sh 'scp -r /var/lib/jenkins/workspace/jenkins-docker/* ubuntu@172.31.17.56:/home/ubuntu/project'
			}		
	} 
	stage('Login into minikube server and run helm chart') {
            steps {
	    sh """
	    
 	    ssh ubuntu@172.31.17.56 << EOF
       	    cd project
            helm install "rutu-$BUILD_NUMBER" demochart
	    exit
	    << EOF
	    """
			}
		}
    }

}

//pipeline{

//	agent any

//	environment {
//		DOCKERHUB_CREDENTIALS=credentials('DOCKER_HUB_LOGIN')
//	}

//	stages {

//		stage('Build') {

//			steps {
//				sh 'docker build -t slkrt2211/testrepo:latest .'
//			}
//		}
//
//		stage('Login') {
//
//			steps {
//				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
//			}
//		}

// 		stage('Push') {

// 			steps {
// 				sh 'docker push darshanrami/rdrep:latest'
// 			}
// 		}
//    }
// 		stage('File transfer into ansible server') {

// 			steps {
// 				sh 'scp /var/lib/jenkins/workspace/devassessment/* ubuntu@172.31.45.226:/home/ubuntu/project'
// 			}
// 		}
// 		stage('Login into ansible server and run playbook') {

// 			steps {
// 				sh """
// 				#!/bin/bash
// 				ssh ubuntu@172.31.45.226 << EOF
// 				cd project
// 				ansible-playbook ap.yml
// 				exit
// 				<< EOF
// 				"""
// 			}
// 		}
// 	}

// 	post {
// 		always {
// 			sh 'docker logout '
// 		}
// 	}

//}
