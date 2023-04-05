FROM prom/prometheus:v2.43.0
LABEL maintainer="agmc22mx@gmail.com"
LABEL description="prometheus server"
LABEL version="1.0"

COPY containers/prometheus/prometheus.yml /etc/prometheus/prometheus.yml
COPY containers/prometheus/alert.yml /etc/prometheus/alert.yml