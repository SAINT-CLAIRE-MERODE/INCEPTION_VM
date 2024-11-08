#!/bin/bash

cd /etc/nginx/conf.d/

 openssl req -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365 -subj '/CN=localhost' 

sleep 2

"nginx" "-g" "daemon off;"