FROM alpine:3.8

# os deps
RUN apk --no-cache upgrade && apk add --no-cache --update alpine-sdk npm python

#RUN npm config delete prefix

# create an unprivileged user to tie to running user
RUN adduser -D user
RUN echo "user    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#RUN mkdir -p /usr/lib/node_modules
#RUN chmod 777 /usr/lib/node_modules
USER user:user
RUN touch ~/.profile


# install nvm
ENV NODE_VERSION v8.11.4
RUN sudo npm config delete prefix && curl https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | ash
#RUN . ${NVM_DIR}/nvm.sh \
#    && nvm alias default ${NODE_VERSION} \
#    && nvm use default
#    && nvm install ${NODE_VERSION} \

#RUN sudo npm install -g local-npm


#RUN mkdir -p /mirror
#RUN chown -R user:user /mirror


#WORKDIR /mirror
