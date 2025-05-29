# 1. 경량 JDK 이미지 기반
FROM eclipse-temurin:21-jdk-jammy

# 2. JAR 파일 복사 (빌드한 파일명에 따라 수정 필요)
COPY clobee-0.0.1-SNAPSHOT.jar app.jar

# 3. 포트 노출 (필요에 따라 수정)
EXPOSE 8080

# 4. 실행 명령어
ENTRYPOINT ["java", "-jar", "app.jar"]