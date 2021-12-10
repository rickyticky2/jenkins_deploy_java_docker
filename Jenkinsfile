pipeline {
  agent {
          docker{
             image 'rickyticky2/agent_jenkins:0.4'
             args '-v /var/run/docker.sock:/var/run/docker.sock -u root '
             registryCredentialsId 'docker_hub'
          }

  }

  stages {

    stage('Clone repo JAVA') {
      steps {
        git 'https://github.com/rickyticky2/jenkins_deploy_java_docker'
       
      }
    }

    stage('Build - Maven') {
      steps {
         sh "mvn package"
      }
    }

    stage('Build And Push Docker Image') {
      steps {
        sh 'docker build --tag=boxfuse .'
        sh 'docker tag boxfuse rickyticky2/boxfuse:1.0'
        sh 'docker push rickyticky2/boxfuse:1.0'

      }
    }

    stage('Run docker on remote host') {
      steps {
             sh 'docker stop boxfuse'
             sh '''ssh root@138.68.165.213 'docker run --rm --name boxfuse -d -p 8081:8080 rickyticky2/boxfuse:1.0' '''
             sh 'echo y | docker images -a'

      }
    }
    
    
  }
}