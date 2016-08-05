#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install python-software-properties
locale-gen UTF-8

cd /opt && \
wget http://nodejs.org/dist/v0.10.31/node-v0.10.31-linux-x64.tar.gz && \
tar zxf node-v0.10.31-linux-x64.tar.gz && \
ln -s /opt/node-v0.10.31-linux-x64/bin/node /usr/local/bin/node && \
ln -s /opt/node-v0.10.31-linux-x64/bin/node-waf /usr/local/bin/node-waf && \
ln -s /opt/node-v0.10.31-linux-x64/bin/npm /usr/local/bin/npm

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
apt-get update && \
apt-get install mongodb-org=2.6.4 mongodb-org-server=2.6.4 mongodb-org-shell=2.6.4 mongodb-org-mongos=2.6.4 mongodb-org-tools=2.6.4 && \
echo "mongodb-org hold" | dpkg --set-selections && \
echo "mongodb-org-server hold" | dpkg --set-selections && \
echo "mongodb-org-shell hold" | dpkg --set-selections && \
echo "mongodb-org-mongos hold" | dpkg --set-selections && \
echo "mongodb-org-tools hold" | dpkg --set-selections && \
sed -i '/bind_ip = 127.0.0.1/,/bind_ip\ =\ 127\.0\.0\.1/s/^/#/' /etc/mongod.conf && \
service mongod restart

curl https://install.meteor.com | sudo sh
sudo npm install -g meteorite
