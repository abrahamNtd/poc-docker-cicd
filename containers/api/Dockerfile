FROM tomcat:9
LABEL maintainer="agmc22mx@gmail.com"

RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y openjdk-17-jdk openjdk-17-jre

RUN groupadd sshgroup 
RUN useradd -ms /bin/bash -g sshgroup sshuser
RUN mkdir /home/sshuser/.ssh

COPY ssh/id_rsa.pub /home/sshuser/.ssh/authorized_keys
COPY ssh/config /home/sshuser/.ssh/config
RUN chown sshuser:sshgroup /home/sshuser/.ssh/authorized_keys
RUN chown sshuser:sshgroup /home/sshuser/.ssh/config

RUN chown -R sshuser:sshgroup /usr/local/tomcat/*

CMD service ssh start && catalina.sh run
