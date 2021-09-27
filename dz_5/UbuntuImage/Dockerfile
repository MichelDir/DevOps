FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install tomcat9 -y
RUN apt-get install maven -y
RUN apt-get install git -y
RUN git clone https://github.com/daticahealth/java-tomcat-maven-example.git /root/tcathw/
RUN mvn clean package --file /root/tcathw/
RUN cp /root/tcathw/target/java-tomcat-maven-example.war /var/lib/tomcat9/webapps/
RUN ln -s /etc/tomcat9 /usr/share/tomcat9/conf
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]
