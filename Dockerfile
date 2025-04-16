## Multistage spring boot dockerfile
# Stage 1: Build the application
FROM  maven:3.9-eclipse-temurin-17 as builder
WORKDIR /builder
COPY ./pom.xml .
COPY src ./src
# target/adasdasdasdas.jar
RUN mvn clean package -DskipTests -Dspring-boot-repackage.exclude=*.json
# Stage 2: Create the runtime image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /builder/target/*.jar app.jar

ENTRYPOINT ["java","-jar", "/app/app.jar"]