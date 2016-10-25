#!/bin/sh -e

systemctl disable apt-daily.timer
systemctl disable apt-daily.service
systemctl stop apt-daily.timer
systemctl stop apt-daily.service

apt-get update
apt-get -y install redis-server redis-tools redis-sentinel python3 python3-pip

pip3 install redis

cp /vagrant/redis-server.service /etc/systemd/system/
cp /vagrant/redis-sentinel.service /etc/systemd/system/
cp /vagrant/node2/redis.conf /etc/redis/
cp /vagrant/node2/sentinel.conf /etc/redis/
cp /vagrant/counter.py /opt
cp /vagrant/counter.service /etc/systemd/system/

rm -f /lib/systemd/system/redis-server.service
rm -f /lib/systemd/system/redis-sentinel.service
systemctl daemon-reload

systemctl enable counter

systemctl restart redis-server
systemctl restart redis-sentinel
systemctl restart counter
