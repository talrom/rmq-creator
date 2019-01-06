FROM openjdk:8-jre-alpine
COPY build/libs/rmq-creator-1.0-SNAPSHOT-all.jar /rmq-creator.jar
CMD ["/usr/bin/java", "-jar", "/rmq-creator.jar"]