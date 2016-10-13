FROM python:2.7

MAINTAINER renaudhager

ENV DEBIAN_FRONTEND=noninteractive \
    PUPPETBOARD_SETTINGS=/var/www/puppetboard/settings.py \
    PUPPETDB_HOST=puppetdb.service.vgt.consul \
    PUPPETDB_PORT=80

RUN mkdir -p /var/www/puppetboard

RUN pip install puppetboard==0.2.0 uwsgi==2.0.14 && \
    apt-get update -y && apt-get install -y nginx

COPY files/nginx.conf /etc/nginx/sites-available/puppetboard
COPY files/start.bash /app/start.bash
COPY files/wsgi.py /var/www/puppetboard/

RUN ln -s /etc/nginx/sites-available/puppetboard /etc/nginx/sites-enabled/puppetboard && \
    chmod u+x /app/start.bash && \
    rm -f /etc/nginx/sites-enabled/default && \
    echo "daemon off;" >>/etc/nginx/nginx.conf

CMD /app/start.bash
