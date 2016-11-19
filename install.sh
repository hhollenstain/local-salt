#!/bin/bash

#Simple setup of a mastersless salt minion
sudo apt -y install software-properties-common;
sudo add-apt-repository "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main";
sudo apt-get update;
sudo apt -y install --allow-unauthenticated salt-minion python-apt;

#Copying salt and pillar configs
sudo cp -R pillar /srv/;
sudo cp -R salt /srv/;

#copying minion configs and restarted
sudo cp minion/minion /etc/salt/minion;
sudo systemctl restart salt-minion;
