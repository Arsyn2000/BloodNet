#!/bin/sh
service tomcat stop
cd /opt/shristationery
git pull
rm -rf target
mvn clean compile install package
cd /usr/share/tomcat/webapps
rm -rf shristationery*
cp /opt/shristationery/target/shristationery.war .
service tomcat start
tail -f /var/log/messages