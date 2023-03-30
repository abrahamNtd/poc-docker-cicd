FROM nginx:stable
LABEL maintainer="agmc22mx@gmail.com"
LABEL description="Web, proxy and apliction server"
LABEL version="1.0"

RUN apt-get update
RUN apt-get install -y openjdk-17-jdk openjdk-17-jre
RUN apt-get install -y openssh-server
RUN apt-get install -y zip
RUN apt-get install -y unzip
RUN apt-get install -y git
RUN apt-get install -y vim

RUN groupadd sshgroup 
RUN useradd -ms /bin/bash -g sshgroup sshuser
RUN echo 'sshuser:pass' | chpasswd

RUN mkdir /home/sshuser/.ssh
RUN mkdir /usr/share/nginx/html/web

COPY ssh/id_rsa.pub /home/sshuser/.ssh/authorized_keys
COPY ssh/config /home/sshuser/.ssh/config

COPY containers/server/nginx.conf /etc/nginx/nginx.conf
COPY containers/server/start.sh /home/sshuser/start.sh
COPY containers/server/stop.sh /home/sshuser/stop.sh

COPY code/home/index.html /usr/share/nginx/html/index.html
COPY code/home/error_404.html /usr/share/nginx/html/error_404.html
COPY code/home/error_50x.html /usr/share/nginx/html/error_50x.html
COPY code/home/img/  /usr/share/nginx/html/img/

COPY code/web/index.html /usr/share/nginx/html/web/index.html

RUN chown -R sshuser:sshgroup /usr/share/nginx/html
RUN chown -R sshuser:sshgroup /home/sshuser/

RUN chmod +x /home/sshuser/start.sh 
RUN chmod +x /home/sshuser/stop.sh 

CMD service ssh start && nginx -g 'daemon off;'