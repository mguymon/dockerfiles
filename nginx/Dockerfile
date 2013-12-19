# DOCKER-VERSION 0.7.1

FROM ubuntu:13.04
MAINTAINER Michael Guymon, michael@tobedevoured.com

RUN echo deb http://archive.ubuntu.com/ubuntu raring main universe multiverse > /etc/apt/sources.list
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:nginx/development
RUN apt-get update
RUN apt-get install -y nginx
RUN rm /etc/nginx/sites-enabled/default
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/extras

VOLUME ["/var/log/nginx", "/etc/nginx/sites-enabled"]

EXPOSE 80 443
CMD ["nginx"]
