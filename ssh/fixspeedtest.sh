#!/bin/bash
rm -rf /usr/bin/speedtest
apt-get install curl
curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
apt-get install speedtest -y
clear
echo done
