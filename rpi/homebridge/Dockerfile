FROM resin/rpi-raspbian:jessie
MAINTAINER Kevin Viet <kevin.viet@gmail.com>
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install toolings
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        avahi-daemon \
        avahi-utils \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        libavahi-compat-libdnssd-dev \
        npm \
        python \
        rsync \
        software-properties-common \
        wget \
    && rm -rf /var/lib/apt/lists/*

# NODEJS installation 
RUN curl -SL https://nodejs.org/dist/latest-v5.x/node-v5.10.1-linux-armv7l.tar.gz \
| tar -xzC /tmp \
&& cp -R /tmp/node-v5.10.1-linux-armv7l/* /usr/local/


# NVM installation
#ENV NVM_DIR /usr/local/nvm
#ENV NODE_VERSION 0.12.13

#RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash \
#   && source $NVM_DIR/nvm.sh \
#    && nvm install $NODE_VERSION \
#   && nvm alias default $NODE_VERSION \
#    && nvm use default

#ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
#ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install an old version of node
RUN cd / \
&& npm install -g homebridge homebridge-openhab

VOLUME /root/.homebrige
EXPOSE 5353 51826
RUN mkdir /plugin
VOLUME /plugin
ADD run.sh /root/run.sh