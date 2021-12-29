FROM eclipse-temurin:17-jre-alpine

WORKDIR /data/

RUN addgroup -S kryonite && adduser -h /data/ -S kryonite -G kryonite
USER kryonite:kryonite

COPY --chown=kryonite:kryonite eula.txt /data/
COPY --chown=kryonite:kryonite paper.yml /data/
COPY --chown=kryonite:kryonite server.properties /data/
COPY --chown=kryonite:kryonite ./data/ /data/

CMD ["java", "-XX:MaxRAMPercentage=75.0", "-jar", "paper.jar"]