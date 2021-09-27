FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53.tar.gz -P /tmp
RUN tar -xvzf /tmp/apache-tomcat-9.0.53.tar.gz -C /opt
RUN export CATALINA_BASE=/opt/apache-tomcat-9.0.53
RUN export CATALINA_HOME=/opt/apache-tomcat-9.0.53
RUN apt-get install maven -y
RUN apt-get install git -y
RUN git clone https://github.com/daticahealth/java-tomcat-maven-example.git /root/tcathw/
RUN mvn clean package --file /root/tcathw/
RUN cp /root/tcathw/target/java-tomcat-maven-example.war /opt/apache-tomcat-9.0.53/webapps/
EXPOSE 8080
CMD ["/opt/apache-tomcat-9.0.53/bin/catalina.sh", "run"]
