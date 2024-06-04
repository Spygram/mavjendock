# Pull base image 
FROM tomcat:10.1.24-jre21-temurin-jammy

WORKDIR /usr/local/tomcat/webapps

COPY target/*.war ./mavjendock.war

EXPOSE 8080
