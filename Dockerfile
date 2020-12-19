# Alpine Linux with OpenJDK JRE
FROM openjdk:16-alpine
# copy WAR into image
COPY target/kafka-indexer-0.0.1-SNAPSHOT.jar /app.jar
# run application with this command line
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "/app.jar"]
EXPOSE 8081