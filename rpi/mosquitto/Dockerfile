FROM arm32v6/alpine:latest
MAINTAINER Kevin Viet <kevin.viet@gmail.com>

LABEL Description="Eclipse Mosquitto MQTT Broker"

RUN apk --no-cache add mosquitto=1.4.12-r0 && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
