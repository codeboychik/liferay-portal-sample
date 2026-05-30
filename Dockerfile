FROM maven:3.9.16-eclipse-temurin-21-alpine as build
LABEL authors="andreychernenko"
WORKDIR /project/

COPY pom.xml pom.xml

RUN mvn de.qaware.maven:go-offline-maven-plugin:resolve-dependencies

COPY . .
RUN mvn clean install


FROM liferay/dxp:2026.q1.7-lts as portal

USER liferay

COPY --from=build --chown=liferay:liferay /project/bundles/osgi/modules/* ./deploy

EXPOSE 8080