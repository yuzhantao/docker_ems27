FROM ubuntu
MAINTAINER yuzhantao "service@yuzhantao.com"

RUN apt-get -y update

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.tar.gz
RUN mkdir -p /usr/lib/jvm/oracle_jdk8
RUN tar -zxf jdk-8u5-linux-x64.tar.gz -C /usr/lib/jvm/oracle_jdk8
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/oracle_jdk8/jre/bin/java 2000
RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/oracle_jdk8/bin/javac 2000
RUN update-alternatives --config java
RUN update-alternatives --config javac

ENV J2SDKDIR /usr/lib/jvm/oracle_jdk8
ENV J2REDIR /usr/lib/jvm/oracle_jdk8/jre
ENV PATH $PATH:/usr/lib/jvm/oracle_jdk8/bin:/usr/lib/jvm/oracle_jdk8/db/bin:/usr/lib/jvm/oracle_jdk8/jre/bin
ENV JAVA_HOME /usr/lib/jvm/oracle_jdk8
ENV DERBY_HOME /usr/lib/jvm/oracle_jdk8/db

EXPOSE 80
