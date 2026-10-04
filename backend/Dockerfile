# ---------- Build ----------
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

# Dependencies are resolved in their own layer so they stay cached
# while only the source code changes.
COPY pom.xml .
RUN mvn -B -q dependency:go-offline

COPY src ./src

# Tests need a running MySQL, so they are not part of the image build.
RUN mvn -B -q -DskipTests package

# ---------- Runtime ----------
FROM eclipse-temurin:21-jre

WORKDIR /app

RUN useradd --system --no-create-home spring
USER spring

COPY --from=build /app/target/*.jar app.jar

# Keeps the JVM inside small instances (512 MB on free plans).
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=70 -XX:+UseSerialGC"

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
