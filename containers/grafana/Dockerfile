FROM grafana/grafana:7.5.7
LABEL maintainer="agmc22mx@gmail.com"
LABEL description="Grafana server"
LABEL version="1.0"

COPY containers/grafana/prometheus_ds.yml /etc/grafana/provisioning/datasources/prometheus_ds.yml

COPY containers/grafana/jvm-micrometer_rev9.json /etc/grafana/provisioning/dashboards/jvm-micrometer_rev9.json
COPY containers/grafana/dashboard.yml /etc/grafana/provisioning/dashboards/dashboard.yml