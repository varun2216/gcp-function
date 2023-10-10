# Use an official Maven image as a parent image
FROM maven:3.8.4-openjdk-11 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy your Maven project's pom.xml and src files to the container
COPY pom.xml .
COPY src ./src

# Build the Maven project
RUN mvn clean install

# Create a minimal JRE-based image for running the Java function
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file produced by the Maven build into the container
COPY --from=builder /app/target/gcp_cloud_function_poc.jar .

# Specify the command to run your Java function (replace with the appropriate command)
CMD ["java", "-jar", "gcp_cloud_function_poc.jar"]
