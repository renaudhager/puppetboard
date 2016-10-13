#!/bin/bash

# Configure puppetboard
echo "PUPPETDB_HOST = '${PUPPETDB_HOST}'" >$PUPPETBOARD_SETTINGS
echo "PUPPETDB_PORT = '${PUPPETDB_PORT}'" >>$PUPPETBOARD_SETTINGS

sed -i 's/LISTEN_PORT/'"$LISTEN_PORT"'/g' /etc/nginx/sites-available/puppetboard

# Start uwsgi server
nohup uwsgi --socket :9090 --wsgi-file /var/www/puppetboard/wsgi.py &

# Start nginx
nginx
