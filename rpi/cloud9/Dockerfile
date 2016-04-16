FROM resin/rpi-raspbian:wheezy
MAINTAINER Kevin Viet <kevin.viet@gmail.com>
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install toolings
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        python \
        rsync \
        software-properties-common \
        wget \
    && rm -rf /var/lib/apt/lists/*

# NVM installation
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 0.12.13

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install an old version of node
RUN cd /
RUN npm install -g node-gyp
RUN git clone git://github.com/c9/core.git cloud9
WORKDIR /cloud9
RUN sudo scripts/install-sdk.sh

# Available workspace
RUN mkdir /workspace
VOLUME /workspace

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Port exposure
EXPOSE 8181
EXPOSE 3000
