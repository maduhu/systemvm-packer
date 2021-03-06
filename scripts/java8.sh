#!/bin/bash

set -x

date

# Oracle Java is the easiest way to get Java8 on Debian7
install_java8 () {

  wget --no-cookies \
--no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz" \
-O /var/tmp/jdk-8-linux-x64.tar.gz 

  mkdir /opt/java-oracle
  tar -zxf /var/tmp/jdk-8-linux-x64.tar.gz -C /opt/java-oracle
  JHome=/opt/java-oracle/jdk1.8.0_131
  update-alternatives --install /usr/bin/java java ${JHome%*/}/bin/java 20000
  update-alternatives --install /usr/bin/javac javac ${JHome%*/}/bin/javac 20000
}

return 2>/dev/null || install_java8
