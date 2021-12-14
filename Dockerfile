# Build stage
#
FROM maven:3.6.0-jdk-8-slim AS build

# Create environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

COPY . /
WORKDIR /myapp
RUN cd /
RUN ls -la & cd /myapp
RUN ls -la
# EXPOSE 8080
# RUN mvn clean package
# CMD java -jar target/myapp-1.0.jar --server.port=5555
