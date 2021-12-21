pipeline {
    agent any
    environment {
        registry = "idoalon/mavenexercise" 
        registryCredential = 'dockerhub_id' 
        dockerImage = ''
    }   
    stages {
        stage('Get Source Code') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
         stage('Deploy to  Dockerhub') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push('latest') 
                    }
                } 
            }
        } 
        stage('Push to Kubernetes Cluster') { 
            steps { 
                script {
                    kubernetesDeploy(configs: "manifests/deployment.yml", kubeconfigId: "kubernetes")
                    sh 'kubectl apply -f manifests/ingress.yml --kubeconfig /home/agent/.kube/config'
                }
            }
        } 
    }
}
