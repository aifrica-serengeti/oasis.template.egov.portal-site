FROM maven:3.5.2-jdk-8-alpine AS builder

# 컨테이너 내 작업 디렉토리 설정
WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY . .

RUN mvn clean install -DskipTests

FROM tomcat:9.0-jre8

WORKDIR /usr/local/tomcat/webapps/

COPY --from=builder /app/target/*.war app.war

EXPOSE 8080
