FROM eclipse-temurin:17-jre-alpine

WORKDIR /data/

RUN addgroup -S citybuild && adduser -h /data/ -S citybuild -G citybuild
USER citybuild:citybuild

COPY --chown=citybuild:citybuild eula.txt /data/
COPY --chown=citybuild:citybuild paper.yml /data/
COPY --chown=citybuild:citybuild ./data/ /data/

CMD ["java", "-XX:MaxRAMPercentage=75.0", "-jar", "paper.jar"]