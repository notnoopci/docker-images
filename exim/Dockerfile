FROM debian:wheezy

RUN apt-get update \
      && apt-get install -y exim4 xtail \
      && rm -rf /var/lib/apt/lists/* \
      && rm -rf /etc/exim4 && mkdir -p /etc/exim4

ADD exim4.conf /etc/exim4/exim4.conf

ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 25
CMD ["exim4"]
