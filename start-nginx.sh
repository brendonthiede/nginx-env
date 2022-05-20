#!/bin/sh

echo "ENVIRONMENT: $ENVIRONMENT"

envsubst '${ENVIRONMENT}' < /index.html.template > /usr/share/nginx/html/index.html

CONFIG_FILE="/ngconfig/$ENVIRONMENT.config.js"

if [ ! -f "$CONFIG_FILE" ]; then
    CONFIG_FILE="/ngconfig/dev.config.js"
fi

echo "CONFIG_FILE: $CONFIG_FILE"
cp $CONFIG_FILE /usr/share/nginx/html/config.js

exec nginx -g 'daemon off;'