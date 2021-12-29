FROM eclipse-temurin:17-jre-alpine

COPY ./data/ /data/
COPY velocity.toml /data/

WORKDIR /data/

CMD ["java", "-jar", "velocity.jar"]