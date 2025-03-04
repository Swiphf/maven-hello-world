# Build stage
#
FROM maven:3.6.0-jdk-8-slim AS build

# Create environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

COPY . /
WORKDIR /my-app
EXPOSE 5555
RUN mvn clean package
