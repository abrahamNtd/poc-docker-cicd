pipelineJob('example') {
  def repo = 'https://github.com/abrahamNtd/poc-java-spring-boot-rest.git' 
  def sshRepo = 'https://github.com/abrahamNtd/poc-java-spring-boot-rest.git' 
  description("Your App Pipeline") 
  keepDependencies(false) 
  properties{
    githubProjectUrl (repo) 
  } 
  definition {
    cpsScm {
      scm {
        git {
          remote { url(sshRepo) } 
          branches('feature/docker') 
          scriptPath('ci/Jenkinsfile') 
          extensions { }
        } 
      } 
    } 
  }
}