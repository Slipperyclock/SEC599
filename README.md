# Cuckoo Sandbox Auto Install 2.0.6
## OS: Ubuntu 18.04.1 LTS Desktop

Poorly modified version from the working version of NVISO-BE/SEC599

Created to add more automation and extra features like remote port forwarding, TOR, Virustotal and Suricata.





## Suricata configuration
	# sudo apt-get install software-properties-common
	# sudo apt-get install suricata
	# Set Suricata enabled in processing.conf.
	# Set suricata to run as root	
	 
Configurations

In /etc/default/suricata, set RUN to "no". 

/etc/suricata/suricata.yaml apply the following changes;

-Set "unix-command.enabled" to "yes".

-Set "unix-command.filename" to "/var/run/suricata/cuckoo.socket". 

-Set "outputs.eve-log.enabled" to "yes".

-Set "file-store.enabled" to yes. 

-Set "run-as.user to "cuckoo " 

-Set "run-as.group to "cuckoo" 

Download suricata.sh script to /opt/cuckoo-configs/suricata.sh

Set "@reboot root /opt/cuckoo-configs/suricata.sh &" to the root crontab.

Set "15 * * * * root /usr/bin/suricatasc -c reload-rules" to the root crontab.
