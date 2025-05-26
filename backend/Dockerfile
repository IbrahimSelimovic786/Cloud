FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

COPY pom.xml .
RUN apk add --no-cache maven
RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn package -DskipTests

EXPOSE 8085
ENTRYPOINT ["java","-jar","target/spring-jwt-0.0.1-SNAPSHOT.jar"]
