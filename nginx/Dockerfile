FROM nginx:1.9.0

ADD nginx.conf /etc/nginx/conf.d/default.conf
ADD docker-entrypoint.sh /
ADD favicon.ico /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80 443 4434
CMD ["nginx"]
