FROM openjdk:11-jdk-slim
VOLUME /tmp
EXPOSE 8081
COPY newbee-mall-1.0.0-SNAPSHOT.jar ./target/newbee-mall-1.0.0-SNAPSHOT.jar
ARG JAR_FILE=newbee-mall-1.0.0-SNAPSHOT.jar
COPY --from=builder ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]