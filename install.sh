#!/bin/bash

function help() {
	echo "Options:"
	echo " -s -- install salt-minion and configs"
  echo " -c -- update saltconfigs"
	echo " -h -- display this usage information"
}

#Simple setup of a mastersless salt minion
function install_salt() {
  sudo apt -y install software-properties-common;
  sudo add-apt-repository "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main";
	wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E08A149DE57BFBE
  sudo apt-get update;
  sudo apt -y install --allow-unauthenticated salt-minion python-apt;
}

#Copying salt,pillar, and minion configs
function update_configs() {
  sudo cp -R pillar /srv/;
  sudo cp -R salt /srv/;
  sudo cp minion/minion /etc/salt/minion;
  sudo systemctl restart salt-minion;
}



while getopts "h?cs" opt; do
    case "$opt" in
    h|\?)
        help
        exit 0
        ;;
    c)  update_configs;
        ;;
    s)  install_salt;
        update_configs;
        ;;
    esac
done
