FROM tomcat:10.1-jdk25-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY tap_foods.war /usr/local/tomcat/webapps/tap_foods.war

EXPOSE 8080

CMD ["catalina.sh", "run"]