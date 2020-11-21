FROM tomcat
RUN apt update
RUN apt install maven -y
RUN apt install git -y
RUN mkdir /tmp/Project/
WORKDIR /tmp/Project/
RUN git clone git://github.com/ilya1291/psyhologytests.git
WORKDIR /tmp/Project/psyhologytests/
RUN mvn clean install
RUN cp /tmp/Project/psyhologytests/psyhologytests-site/target/psyhologytests.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
