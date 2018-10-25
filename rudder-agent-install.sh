#!/bin/bash
# rudder-agent install in Debian
# rudder ver. 5

apt install -y lsb-release
wget --quiet -O- "https://repository.rudder.io/apt/rudder_apt_key.pub" | sudo apt-key add -
echo "deb http://repository.rudder.io/apt/5.0/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list
apt-get update
apt-get install rudder-agent

echo 'Type server hostname or IP address:'
read rudder_server
echo $rudder_server > /var/rudder/cfengine-community/policy_server.dat
echo $rudder_server ' saved in policy_server.dat file'
