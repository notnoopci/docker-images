#!/bin/bash

set -ex

if [ "$1" = 'slanger' ]; then
    SLANGER_APP_KEY="${SLANGER_APP_KEY:-app}"
    SLANGER_APP_SECRET="${SLANGER_APP_SECRET:-mysupersecret}"

    exec slanger \
        --app_key "${SLANGER_APP_KEY}" \
        --secret "${SLANGER_APP_SECRET}" \
        --cert_file /ssl/ssl.crt \
        --private_key_file /ssl/ssl.key \
        --api_host 0.0.0.0:4567 \
        --websocket_host 0.0.0.0:8080 \
        --redis_address "redis://${REDIS_PORT_6379_TCP_ADDR}:${REDIS_PORT_6379_TCP_PORT}"
fi

exec "$@"
