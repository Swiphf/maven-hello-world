pipeline {
    environment {
        registry = "idoalon/maven_exercise" 
        registryCredential = 'dockerhub_id' 
        dockerImage = ''
    }
    agent any
    tools {
        maven 'Maven 3.6.0' 
        jdk 'jdk8' 
    }
    stages {
        stage('Get Source Code') {
            steps {
                git 'https://github.com/Swiphf/maven-hello-world.git'
            }
        }
        stage('Build Image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
         stage('Deploy our image') { 
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
    }
}
