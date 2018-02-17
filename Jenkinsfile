pipeline {
  // You can also use docker agents by specifying:  docker "image-from-dockerhub"
  agent { label 'home' }
  // This is a tool preconfigured in Jenkins.  Just enable and name from your configuration screen 
  tools { maven 'M3' }
  stages {
    stage("Build") {
      steps {
        bat 'mvn clean compile'
      }
    }

    stage("Test") {
      steps {
        echo "Run the tests; this could potentially be pulled together into one maven command; breaking up"
        bat 'mvn test package'
        junit '**/target/surefire-reports/TEST-*.xml'
        archive 'target/*.jar'
      }
    }

    // Add different test suites as different stages in your pipeline
    // Stages can also run on specific nodes if needed

    stage("Deploy") {
      steps {
        // Build the docker container and ship it!
        echo 'This will be the external deploy'
        script {
          def ato_app = docker.build("kwhetstone/sparkjava-os101:${env.BUILD_TAG}")
          //push to dockerhub; credentials definied in Jenkins
          docker.withRegistry("https://registry.hub.docker.com", 'kwhetstone_dockerhub') { 
            ato_app.push 'latest'
          }
        }
      }
    }
  }
}
