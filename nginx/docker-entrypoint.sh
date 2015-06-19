#!/bin/bash

set -ex

if [ "$1" = 'nginx' ]; then
    CIRCLE_HOST=${CIRCLE_PORT_8080_TCP_ADDR}
    CIRCLE_PORT=${CIRCLE_PORT_8080_TCP_PORT}

    NGINX_CONF=/etc/nginx/conf.d/default.conf

    sed -i "s/__CIRCLE_HOST__/$CIRCLE_HOST/g" $NGINX_CONF
    sed -i "s/__CIRCLE_PORT__/$CIRCLE_PORT/g" $NGINX_CONF

    exec nginx -g "daemon off;"
fi

exec "$@"
