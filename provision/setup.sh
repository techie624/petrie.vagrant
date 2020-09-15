#!/usr/bin/env bash

#@author: (rpetrie) rlp243@cornell.edu

#-----------------------------------------------------------------------------#
### ALL NODES 
#-----------------------------------------------------------------------------#
set -u
set -e
set -x

#-----------------------------------------------------------------------------#
### Update & Installs

sudo apt update || true; sudo apt install -y htop vim tree ||true;

#-----------------------------------------------------------------------------#
### Set Up vars

IP_ADD=$(ip addr show enp0s8 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
IP_HOSTS="$IP_ADD	scgdm	scgdm.gobii.org"
echo;

#-----------------------------------------------------------------------------#
### Start Services

### ldap service start
echo "Starting up slapd...";
echo;

docker exec -u root gobii-ldap-node bash -c "
service slapd status;
service slapd start;
sleep 3
service slapd status;
exit;
" || true;

### Haplotool service start
echo "Starting up Haplotool...";
echo;

docker exec -u root gobii-haplo-node bash -c "
sudo -H -u shiny /usr/bin/shiny-server.sh;
exit;
" || true;

#-----------------------------------------------------------------------------#
### User Messages

echo "VM IP is: $IP_ADD"
echo;

echo "Please add the following line to your /etc/hosts file: ";
echo "$IP_HOSTS";
echo;

echo "
The instance of scGDM is now deployed and running!
Once you have added the above line to your hosts file
you can access the Extractor UI @:

scgdm.gobii.org:80881/gobii-dev

or

$IP_ADD:8081/gobii-dev
"
echo;

echo "Deployment completed!";
echo;
