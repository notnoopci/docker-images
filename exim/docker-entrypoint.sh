#!/bin/bash

set -ex

if [ "$1" = 'exim4' ]; then
    PRIMARY_HOST=${PRIMARY_HOST:-circleci.com}
    ALLOWED_HOSTS=${ALLOWED_HOSTS:-0.0.0.0/0}

    mkdir -p /etc/exim4

    echo $PRIMARY_HOST > /etc/exim4/primary_host
    echo "127.0.0.1 ; ::1 ;" "$ALLOWED_HOSTS" > /etc/exim4/allowed_hosts

    # Make sure spool directory is writable (if a mounted volume)
    chown Debian-exim /var/spool/exim4

    # Sort of hack to send logs to stdout
    xtail /var/log/exim4 &

    /usr/sbin/exim4 -bdf -q30m
fi

exec "$@"
