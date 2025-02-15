FROM docker.io/library/ubuntu:18.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz  /tmp/apache-tomcat-9.0.98.tar.gz
RUN cd /tmp &&  tar xvfz apache-tomcat-9.0.98.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.98/* /usr/local/tomcat/
RUN rm /tmp/apache-tomcat-9.0.98.tar.gz
ADD target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8090
CMD /usr/local/tomcat/bin/catalina.sh run
