#! /bin/bash

docker run -v /vagrant/nginx_root:/usr/share/nginx/html:ro -p 8080:80 -d nginx
