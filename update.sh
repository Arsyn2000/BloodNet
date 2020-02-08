#!/bin/sh
systemctl stop tomcat
cd /opt/stoneandtile
git pull
rm -rf target
mvn clean compile install package
cd /usr/share/tomcat/webapps
rm -rf stoneandtile*
cp /opt/stoneandtile/target/stoneandtile.war .
systemctl start tomcat
tail -f /var/log/messages