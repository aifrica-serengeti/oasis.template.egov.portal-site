# 배포 스테이지: Tomcat 이미지를 사용하여 WAR 파일 배포
FROM tomcat:9.0-jre8

# 빌드된 WAR 파일을 Tomcat의 webapps 디렉토리에 복사
COPY target/*.war /usr/local/tomcat/webapps/
