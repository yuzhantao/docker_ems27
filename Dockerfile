FROM ubuntu
MAINTAINER yuzhantao "help@yuzhantao.com"

RUN apt-get -y update
RUN apt-get -y install tomcat7 default-jdk

ENV CATALINA_HOME /usr/share/tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
ENV CATALINA_PID /var/run/tomcat7.pid
ENV CATALINA_SH /usr/share/tomcat7/bin/catalina.sh
ENV CATALINA_TMPDIR tomcat7-tomcat7-tmp

RUN mkdir -p $CATALINA_TMPDIR

VOLUME ["/var/lib/tomcat7/webapps/"]

EXPOSE 8080

ENTRYPOINT ["/usr/share/tomcat7/bin/catalina.sh","run"]
