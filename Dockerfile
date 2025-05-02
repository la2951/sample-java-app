# Use an OpenJDK base image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file (from Maven)
COPY target/*.jar app.jar

# Expose the port (default for Spring Boot)
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
