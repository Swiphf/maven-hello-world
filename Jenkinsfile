pipeline {
    agent any
    environment {
        registry = "idoalon/maven-exercise" 
        registryCredential = 'dockerhub_id' 
        dockerImage = ''
    }   
    stages {
        stage('Get Source Code') {
            steps {
                git 'https://github.com/Swiphf/maven-hello-world.git'
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
                        dockerImage.push() 
                    }
                } 
            }
        } 
         stage('Cleanup') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        }
        stage('Push to Kubernetes Cluster') { 
            steps { 
                script {
                    kubernetesDeploy(configs: "deployment.yml", kubeconfigId: "kubernetes")
                }
            }
        } 
    }
}
