#!/bin/bash

if [ -d "/opt/digitalocean" ]; then
	sed -i 's/32m/34m/g' ~/.bashrc && echo -e "color_prompt=yes\n$(cat ~/.bashrc)" > ~/.bashrc &&  source ~/.bashrc
else
	sed -i 's/32m/31m/g' ~/.bashrc && echo -e "color_prompt=yes\n$(cat ~/.bashrc)" > ~/.bashrc &&  source ~/.bashrc
fi

fallocate -l 8G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

apt-get install -y libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
apt-get install -y libzmq3-dev node-gyp
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
#curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
#curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
apt-get install -y nodejs
npm install npm@latest -g

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce

curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

apt upgrade -y
apt update -y
reboot
