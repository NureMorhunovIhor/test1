FROM maven:3.9-eclipse-temurin-21 AS build

COPY . .

RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-alpine

COPY --from=build /app/target/*.jar demo.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "demo.jar"]