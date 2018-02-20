#!/bin/bash
#get cert move to jenkins start jenkins
# envsubst takes a whitespace sepratet list of vars to replace. Otherwise it will break things like $http_host
# example: envsubst '\$DOMAIN \$PORT' < /nginx.config.template > /etc/nginx/sites-available/default
# will replace $DOMAIN and $PORT only
envsubst '\$DOMAIN' < /nginx.conf.template > /etc/nginx/sites-available/default
nginx 
#/usr/bin/certbot certonly --standalone --preferred-challenges http -d ${domain} --config-dir /var/jenkins_home/certs/config --cert-path /var/jenkins_home/certs/
mkdir -p /var/jenkins_home/certs/www
certbot --authenticator webroot --installer nginx --webroot -w /var/jenkins_home/certs/www -d $domain -m martin@ventx.de --config-dir /var/jenkins_home/certs/config --cert-path /var/jenkins_home/certs/ -n
/sbin/tini -- /usr/local/bin/jenkins.sh
