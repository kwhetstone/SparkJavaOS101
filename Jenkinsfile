pipeline {
  /*agent {
      label 'croissant'
  }*/
  agent any
  tools {
      maven 'M3'
  }
  stages {
    stage("Build") {
      steps {
        sh 'mvn clean compile'
      }
    }

    stage("Test") {
      steps {
        echo "Run the tests; this could potentially be pulled together into one maven command"
        sh 'mvn test package'
        junit '**/target/surefire-reports/TEST-*.xml'
        archive 'target/*.jar'
      }
    }

    milestone label: 'prod'
    stage("Deploy") {
        // Build the docker container and ship it!
        /*echo 'This will be the external deploy'
      script {
        def ato_app = docker.build("kwhetstone/ato_demo:${env.BUILD_TAG}", 'nodeLoc')
        //push to dockerhub; credentials definied in Jenkins
        docker.withRegistry("https://registry.hub.docker.com", 'kwhetstone_dockerhub') { 
                ato_app.push 'latest'
        }
      }*/
    }
  }
}
