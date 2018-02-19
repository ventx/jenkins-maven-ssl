#!/bin/bash
#get cert move to jenkins start jenkins
nginx 
#/usr/bin/certbot certonly --standalone --preferred-challenges http -d ${domain} --config-dir /var/jenkins_home/certs/config --cert-path /var/jenkins_home/certs/
/sbin/tini -- /usr/local/bin/jenkins.sh
