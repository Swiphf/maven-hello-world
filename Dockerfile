# Build stage
#
FROM maven:3.6.0-jdk-8-slim AS build
COPY . /my-app
WORKDIR /my-app
EXPOSE 8080
RUN cd /my-app/my-app && echo $(ls -la)
RUN mvn -f /my-app/my-app/pom.xml clean package
