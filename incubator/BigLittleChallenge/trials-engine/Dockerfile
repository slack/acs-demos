FROM biglittlechallenge/trials-model

COPY . /usr/src/app/trials-engine
WORKDIR /usr/src/app/trials-engine
RUN mvn -s /m2/maven-settings.xml package shade:shade

CMD ["java", "-jar", "/usr/src/app/trials-engine/target/trials-engine-0.0.1-SNAPSHOT.jar"]