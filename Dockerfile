FROM maven:3.9.16-eclipse-temurin-21-alpine AS deps
LABEL authors="andreychernenko"
WORKDIR /project/

COPY pom.xml .
COPY modules/pom.xml modules/pom.xml
COPY themes/pom.xml themes/pom.xml
COPY modules/mvc-portlet/pom.xml modules/mvc-portlet/pom.xml
RUN mvn de.qaware.maven:go-offline-maven-plugin:resolve-dependencies

FROM maven:3.9.16-eclipse-temurin-21-alpine AS build
WORKDIR /project/

COPY --from=deps /root/.m2 /root/.m2
COPY . .
RUN mvn clean install


FROM liferay/dxp:2026.q1.7-lts AS portal

USER liferay

COPY --from=build --chown=liferay:liferay /project/bundles/osgi/modules/* ./deploy

EXPOSE 8080