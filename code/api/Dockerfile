FROM eclipse-temurin:17-jre-alpine
LABEL maintainer="agmc22mx@gmail.com"
VOLUME /tmp
COPY app/build/libs/app-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]