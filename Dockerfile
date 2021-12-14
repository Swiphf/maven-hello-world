# Build stage
#
FROM maven:3.6.0-jdk-8-slim AS build

# Create environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

COPY . /
WORKDIR /my-app
EXPOSE 8080
RUN mvn -f /my-app/pom.xml clean compile exec:java
CMD java -jar target/my-app-1.0-SNAPSHOT.jar
