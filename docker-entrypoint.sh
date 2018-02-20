#!/bin/bash
#get cert 
letsencrypt certonly --standalone -d ${DOMAIN} -n -m martin@ventx.de --agree-tos --config-dir /var/jenkins_home/certs/config --cert-path /var/jenkins_home/certs/
# convert template to nginx conf with envsubst
# envsubst takes a whitespace sepratet list of vars to replace. Otherwise it will break things like $http_host
# example: envsubst '\$DOMAIN \$PORT' < /nginx.config.template > /etc/nginx/sites-available/default
# will replace $DOMAIN and $PORT only
envsubst '\$DOMAIN' < /nginx.conf.template > /etc/nginx/sites-available/default
# start nginx
nginx 
#/usr/bin/certbot certonly --standalone --preferred-challenges http -d ${domain} --config-dir /var/jenkins_home/certs/config --cert-path /var/jenkins_home/certs/
#mkdir -p /var/jenkins_home/certs/www
#certbot --authenticator webroot --installer nginx --webroot -w /var/jenkins_home/certs/www -d $DOMAIN -m martin@ventx.de --agree-tos --config-dir /var/jenkins_home/certs/config --cert-path /var/jenkins_home/certs/ -n
# start jenkins
/sbin/tini -- /usr/local/bin/jenkins.sh
