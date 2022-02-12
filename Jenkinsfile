pipeline {
    agent any 
    environment {
        registry = "sravangcpdocker/toolkit"
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
    
    stages {
        stage('Cloning Git') {
            steps {
                sh 'https://github.com/sravan-github/terraform-docker.git'
                sh 'pwd'
                sh 'cd terraform-docker'
                sh 'ls -ltr'
            }
        }
    
    // Building Docker images
    stage('Building image') {
      steps{
        script {
            sh 'cp /var/lib/jenkins/workspace/dockerbulid/terraform-docker/Dockerfile /var/lib/jenkins/workspace/dockerbulid/ '
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    
     // Uploading Docker images into Docker Hub
    stage('Upload Image') {
     steps{    
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
        }
      }
    }
 }

 post {
        always {
            cleanWs deleteDirs: true
        }
     }
}
