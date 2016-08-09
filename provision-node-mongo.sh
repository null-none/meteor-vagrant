#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install python-software-properties
locale-gen UTF-8

sudo apt-get update
sudo apt-get install -y curl
sudo apt-get install -y npm
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential libssl-dev

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

curl https://install.meteor.com | /bin/sh
sudo npm install -g meteorite
