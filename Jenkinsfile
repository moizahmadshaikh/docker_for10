pipeline { 
    agent any 
 
    environment { 
        // Define environment variables if needed 
        DOCKER_HUB_CREDENTIALS = '0098f00e-326c-4890-aa59-ae4263c21eb5' 
        DOCKER_IMAGE_NAME = 'moizshaikh/javaassignment10'
        DOCKER_IMAGE_TAG = "${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}" 
    } 
 
    stages { 
        stage('Checkout') {       
             steps { 
                      checkout scm
            } 
        } 
 
        stage('Build and Push Docker Image') {
             steps { 
                script { 
                    // Build the Docker image 
                    def dockerImage = docker.build("${DOCKER_IMAGE_TAG}") 
 
                   
                    docker.withRegistry('https://registry.hub.docker.com', "${DOCKER_HUB_CREDENTIALS}") { 
                        // Push the Docker image to Docker Hub 
                        dockerImage.push() 
                    } 
                } 
            } 
        } 
    } 
 
    post {
         success { 
            echo "Docker image built and pushed successfully" 
        } 
    } 
} 
