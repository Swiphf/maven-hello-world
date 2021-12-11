# Build stage
#
FROM maven:3.6.0-jdk-8-slim AS build

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;
    
# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

COPY . /
WORKDIR /my-app
EXPOSE 8080
RUN cd /my-app/ && echo $(ls -la)
RUN mvn -f /my-app/pom.xml clean package
