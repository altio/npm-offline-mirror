#!/usr/bin/env bash
NEXUS_DATA_DIR=/opt/nexus
sudo mkdir --parents $NEXUS_DATA_DIR && sudo chown -R 200 $NEXUS_DATA_DIR
docker-compose up -d
