pipelineJob('backend_pipeline') {
  def repo = 'https://github.com/abrahamNtd/poc-docker-cicd.git' 
  description("Jenkins Pipeline for building and testing a rest  service") 
  keepDependencies(false) 
  properties{
    githubProjectUrl (repo) 
  } 
  definition {
    cpsScm {
      scm {
        git {
          remote { url('https://github.com/abrahamNtd/poc-docker-cicd.git') } 
          branches('main') 
          scriptPath('code/api/ci/Jenkinsfile') 
          extensions { }
        } 
      } 
    } 
  }
}