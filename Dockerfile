FROM ubuntu:trusty

RUN apt-get update
RUN apt-get -qy install icecast2 nginx

RUN rm -rf /etc/icecast2
ADD etc/icecast2 /etc/icecast2
RUN chown -R icecast2 /etc/icecast2

RUN rm -rf /etc/nginx/sites-enabled/default
ADD etc/nginx_broadcast.conf /etc/nginx/sites-enabled/broadcast.conf

ADD start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

WORKDIR /root
CMD ["start.sh"]
