FROM nginx:stable
LABEL maintainer="agmc22mx@gmail.com"

RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y unzip

RUN groupadd sshgroup 
RUN useradd -ms /bin/bash -g sshgroup sshuser
RUN echo 'sshuser:pass' | chpasswd
RUN mkdir /home/sshuser/.ssh
RUN mkdir /usr/share/nginx/html/app/

COPY containers/web/index.html /usr/share/nginx/html/index.html
COPY containers/web/nginx.conf /etc/nginx/nginx.conf
COPY ssh/id_rsa.pub /home/sshuser/.ssh/authorized_keys
COPY ssh/config /home/sshuser/.ssh/config

RUN chown -R sshuser:sshgroup /home/sshuser/.ssh/
RUN chown -R sshuser:sshgroup /usr/share/nginx/html/

CMD service ssh start && nginx -g 'daemon off;'