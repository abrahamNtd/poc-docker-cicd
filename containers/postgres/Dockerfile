FROM postgres:15.1-alpine
LABEL maintainer="agmc22mx@gmail.com"
LABEL description="Postgres 15"
LABEL version="1.0"

ENV POSTGRES_USER root
ENV POSTGRES_PASSWORD admin
ENV POSTGRES_DB postgresdb

COPY containers/postgres/init.sql /docker-entrypoint-initdb.d/