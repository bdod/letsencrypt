#!/bin/bash

# you need add this location to you nginx server config
#  location /.well-known/acme-challenge {
#    allow all;
#    root /etc/letsencrypt/challenges;
#  }

[[ -d /etc/letsencrypt/challenges ]] || mkdir -p /etc/letsencrypt/challenges

#certbot="certbot"
certbot="docker run -it --rm --name certbot -v /etc/letsencrypt:/etc/letsencrypt certbot/certbot"

domain_list="domain1.com domain2.com some.domain3.com test.superdomain.ru"

param_domain_list=""

for i in $domain_list ; do param_domain_list+="-d $i " ; done

echo "$param_domain_list"

$certbot certonly --webroot -w /etc/letsencrypt/challenges  $param_domain_list
