# -------- Stage 1 : Build Stage --------
FROM eclipse-temurin:17-jdk AS builder

WORKDIR /build

COPY ./target/spring-petclinic-3.2.0-SNAPSHOT.jar app.jar


# -------- Stage 2 : Runtime Stage --------
FROM eclipse-temurin:17-jre

WORKDIR /home/petclinic

COPY --from=builder /build/app.jar app.jar

EXPOSE 8080

ENV MYSQL_URL=jdbc:mysql://petclinic-mysql:3306/petclinic

CMD ["java", "-jar", "app.jar"]