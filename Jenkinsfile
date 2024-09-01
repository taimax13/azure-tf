
//pipline really simple

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("<your-acr-name>.azurecr.io/hello-world-webapp:v1")
                }
            }
        }
        stage('Push to ACR') {
            steps {
                script {
                    docker.withRegistry('https://<your-acr-name>.azurecr.io', 'acr_credentials_id') {
                        dockerImage.push('v1')
                    }
                }
            }
        }
        stage('Deploy to AKS') {
            steps {
                script {
                    kubernetesDeploy(
                        configs: 'k8s/deployment.yaml',
                        kubeconfigId: 'kubeconfig-credential-id'
                    )
                }
            }
        }
    }
}
