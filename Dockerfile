# Build stage
#
FROM maven:3.6.0-jdk-8-slim AS build
RUN sudo apt-get install openjdk-8-jdk
RUN sudo apt-get install openjdk-8-jdk
COPY . /
WORKDIR /my-app
EXPOSE 8080
RUN cd /my-app/ && echo $(ls -la)
RUN mvn -f /my-app/pom.xml clean package
