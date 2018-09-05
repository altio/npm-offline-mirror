#!/usr/bin/env bash
. $NVM_DIR/nvm.sh \
    && local-npm \
    --directory /data \
    --log-level info \
    --port 5080 \
    --pouch-port 6789 \
    --remote https://registry.npmjs.org \
    --remote-skim https://replicate.npmjs.com \
    --url http://0.0.0.0:5080
