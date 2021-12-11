# Build stage
#
FROM maven:3.6.0-jdk-8-slim AS build
COPY . /my-app
WORKDIR /my-app
EXPOSE 8080
RUN mvn -f /my-app/pom.xml clean package
