FROM nginx:stable
LABEL maintainer="agmc22mx@gmail.com"

RUN apk update 
RUN apk add -y bash
RUN apk add -y git
RUN apk add -y vim

COPY containers/home/index.html /usr/share/nginx/html/index.html
COPY containers/home/img/  /usr/share/nginx/html/img/
