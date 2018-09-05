FROM debian:stretch-slim

# os deps
RUN apt-get update && apt-get install -y build-essential nodejs
RUN apt-get update && apt-get install -y curl

# create an unprivileged user to tie to running user
RUN groupadd --gid 1000 node \
    && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

# create a target for the cache
RUN mkdir -p /data
RUN chown -R node:node /data

USER node:node
WORKDIR /home/node

# install nvm
ENV NODE_VERSION v8.11.4
ENV NVM_DIR /home/node/.nvm
RUN mkdir -p ${NVM_DIR}
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN . ${NVM_DIR}/nvm.sh \
    && nvm alias default ${NODE_VERSION} \
    && nvm use default \
    && npm install -g local-npm
