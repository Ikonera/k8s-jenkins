pipeline {
	agent any

	environment {
		imageName = "ikonera/cicd-project"
		registryCredentialSet = "dockerhub"
		dockerInstance = ''
	}

	stages {
		stage ("build") {
			steps {
				echo "Docker image building..."
				script {
					dockerInstance = docker.build(imageName)
				}
			}
		}
		stage ("publish") {
			steps {
				echo "Publishing to Docker Hub..."
				script {
					docker.withRegistry('', registryCredentialSet) {
						dockerInstance.push("${env.BUILD_NUMBER}")
						dockerInstance.push("latest")
					}
				}
				echo "Published !"
			}
		}

		stage ("deploy") {
			steps {
				echo "Wait to deploy to Kubernetes..."
			}
		}
	}
}
