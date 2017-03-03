FROM maven:3.3.9-jdk-8

COPY ./maven-settings.xml /m2/maven-settings.xml

COPY . /usr/src/app/core
WORKDIR /usr/src/app/core

RUN mvn -s /m2/maven-settings.xml install
