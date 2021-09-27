FROM tomcat
RUN apt-get update
RUN apt-get install maven -y
RUN apt-get install git -y
RUN git clone https://github.com/daticahealth/java-tomcat-maven-example.git /root/tcathw/
RUN mvn clean package --file /root/tcathw/
RUN cp /root/tcathw/target/java-tomcat-maven-example.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
