#!/bin/bash
#get cert move to jenkins start jenkins
nginx 
#/usr/bin/certbot certonly --standalone --preferred-challenges http -d ${domain} --config-dir /var/jenkins_home/certs/config --cert-path /var/jenkins_home/certs/
mkdir -p /var/jenkins_home/certs/www
certbot --authenticator webroot --installer nginx --webroot -w /var/jenkins_home/certs/www -d $domain -m martin@ventx.de --config-dir /var/jenkins_home/certs/config --cert-path /var/jenkins_home/certs/ -n
/sbin/tini -- /usr/local/bin/jenkins.sh
