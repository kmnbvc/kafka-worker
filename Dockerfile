# Alpine Linux with OpenJDK JRE
FROM openjdk:16-alpine
# copy WAR into image
COPY target/kafka-indexer-0.0.1-SNAPSHOT.jar /app.jar
COPY scripts/health.sh /health.sh
# run application with this command line
#HEALTHCHECK --start-period=10s --retries=3 CMD /health.sh
EXPOSE 8081
CMD ["java", "-jar", "-Dspring.profiles.active=default", "/app.jar"]