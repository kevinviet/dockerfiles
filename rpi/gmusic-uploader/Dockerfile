FROM resin/raspberrypi-alpine-python:3.6.0-slim
MAINTAINER kevin.viet@gmail.com

RUN echo \
  && apk update \
  && apk upgrade \
  && apk add --update \
     linux-headers \
     musl-dev \
     gcc \
  && rm -rf /var/cache/apk/* \
  && pip install \
     gmusicapi \
     https://github.com/thebigmunch/gmusicapi-scripts/zipball/master

COPY container/cron/root.crontab /var/spool/cron/crontabs/root
COPY container/scripts/ /scripts

VOLUME /credentials
VOLUME /music

CMD ["crond", "-d", "0", "-f"] 
