FROM jenkins/jenkins:2.375.3
LABEL maintainer="agmc22mx@gmail.com"
LABEL description="jenkins"
LABEL version="1.0"

USER root

RUN apt-get update 
RUN apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get install -y docker-ce-cli

RUN apt-get install -y openjdk-17-jdk openjdk-17-jre
RUN apt-get install -y openssh-server
RUN apt-get install -y zip
RUN apt-get install -y unzip
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install GitPython
RUN pip3 install pyyaml

RUN mkdir -p /home/jenkins/.ssh
COPY ssh/id_rsa /home/jenkins/.ssh/id_rsa
COPY ssh/id_rsa.pub /home/jenkins/.ssh/authorized_keys
COPY ssh/config /home/jenkins/.ssh/config
RUN chmod 600 /home/jenkins/.ssh/id_rsa
RUN chown -R jenkins /home/jenkins/

USER jenkins

COPY containers/jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY containers/jenkins/jenkins-configuration.yaml /var/jenkins_home/jenkins-configuration.yaml
COPY containers/jenkins/seedjob.groovy /usr/local/seedjob.groovy

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/jenkins-configuration.yaml

RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt