pipeline {
    agent {
        label "${AGENT}"
    }

    stages {
        stage("Installation des dépendances") {
            steps {
                sh "apt-get update && apt-get install -y php-xml"
            }
        }
        stage("Continuous Integration / Intégration Continue") {
            steps {
                git branch: "main", url: "https://github.com/adamKHTML/MyBank_backend"
                sh "composer install"
            }
        }
        stage("Continuous Delivery / Livraison Continue") {
            steps {
                sh "docker build . -t ${DOCKERHUB_USERNAME}/MyBank_backend"
                sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKER_PASSWORD}" // Créer un PAT sur Docker Hub : https://app.docker.com/settings/personal-access-tokens
                sh "docker push ${DOCKERHUB_USERNAME}/MyBank_backend"
            }
        }
    }
}