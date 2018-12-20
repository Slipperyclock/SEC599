#!/bin/sh
# Taken from https://github.com/cuckoosandbox/cuckoo/blob/master/stuff/suricata.sh
# Install Suricata.
# $ sudo apt-get install software-properties-common
# $ sudo apt-get update
# $ sudo apt-get install suricata
# 
# Enable Suricata in Processing.conf
# Set socket = /var/run/suricata/cuckoo.socket
#
# Set Suricata to run w/ root for cuckoo user.
# $ chmod u+s /usr/bin/suricata.generic
#
# Setup Suricata configuration.
#
# In /etc/default/suricata, set RUN to "no". Default = no
#
# In /etc/suricata/suricata.yaml apply the following changes;
# * Set "unix-command.enabled" to "yes". Default = yes
# * Set "unix-command.filename" to "/var/run/suricata/cuckoo.socket".
# * Set "outputs.eve-log.enabled" to "yes". Default = yes
# * Set "file-store.enabled" to "yes"
# * Set "run-as.user to "your cuckoo user"
# * Set "run-as.group to "your cuckoo user group"
# * 
#
# Add "@reboot /opt/SEC599/suricata.sh" to the root crontab.
# This will reload suricata rules
# Add "15 * * * * /usr/bin/suricatasc -c reload-rules" to the root crontab.

. /home/cuckoo/.cuckoo

# Do we want to run Suricata in the background?
if [ "$SURICATA" -eq 0 ]; then
    exit
fi

mkdir /var/run/suricata
chown cuckoo:cuckoo /var/run/suricata

suricata --unix-socket -k none -D

while [ ! -e /var/run/suricata/cuckoo.socket ]; do
    sleep 1
done
