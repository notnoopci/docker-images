FROM ruby:2.1.5

RUN gem install slanger

COPY docker-entrypoint.sh /

ENV LANG=en_US.UTF-8
ENV RUBYOPT='-E utf-8'

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 4567 8080
CMD ["slanger"]
