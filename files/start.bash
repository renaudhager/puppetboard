#!/bin/bash

# Configure puppetboard
echo "PUPPETDB_HOST = '${PUPPETDB_HOST}'" >$PUPPETBOARD_SETTINGS
echo "PUPPETDB_PORT = '${PUPPETDB_PORT}'" >>$PUPPETBOARD_SETTINGS

# Start uwsgi server
nohup uwsgi --socket :9090 --wsgi-file /var/www/puppetboard/wsgi.py &

# Start nginx
nginx
