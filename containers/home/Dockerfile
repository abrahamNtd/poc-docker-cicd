FROM nginx:alpine
LABEL maintainer="agmc22mx@gmail.com"

RUN apk update && apk add bash

COPY containers/home/index.html /usr/share/nginx/html/index.html
COPY containers/home/img/  /usr/share/nginx/html/img/
