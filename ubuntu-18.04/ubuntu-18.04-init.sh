#!/bin/bash

# rm the lock
sudo rm /var/cache/apt/archives/lock-frontend
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

# resolving apt mirror
sudo bash -c "echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' > /etc/apt/sources.list"
#sudo -H apt-get -y update
#sudo -H apt-get -y upgrade 
#
## resolving python3-pip python-pip git curl net-tools
#sudo -H apt-get -y  install python3-pip python-pip git curl net-tools build-essential
#
#sudo -H python3 -m pip install -U pip -i https://pypi.doubanio.com/simple
#sudo -H python3 -m pip config set global.index-url https://pypi.doubanio.com/simple
#sudo -H python3 -m pip config set global.trusted-host pypi.doubanio.com
#
#sudo -H python -m pip install -U pip -i https://pypi.doubanio.com/simple
#sudo -H python -m pip config set global.index-url https://pypi.doubanio.com/simple
#sudo -H python -m pip config set global.trusted-host pypi.doubanio.com

sudo timedatectl set-timezone Asia/Shanghai
exit
