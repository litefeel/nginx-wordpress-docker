FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/default.conf
COPY wordpress.conf /etc/nginx/global/wordpress.conf
COPY restrictions.conf /etc/nginx/global/restrictions.conf
COPY proxy.conf /etc/nginx/global/proxy.conf
COPY docker-entrypoint.sh /entrypoint.sh

# Let's Encrypt
# install certbot for nginx on debian 9 (stretch)
# https://certbot.eff.org/#debianstretch-nginx
RUN cat /etc/apt/sources.list
RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN apt-get install python-certbot-nginx -t stretch-backports

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
