FROM maven:3.8.4-openjdk-11 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

FROM openjdk:11-jdk-slim
VOLUME /tmp
EXPOSE 8080
ARG JAR_FILE=/app/target/newbee-mall-1.0.0-SNAPSHOT.jar
COPY --from=builder ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]