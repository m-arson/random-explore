#!/usr/bin/env bash

chmod 600 certs/portainer.key
chmod 644 certs/portainer-bundle.crt

docker rm -f portainer 2>/dev/null || true
docker compose down --volumes --remove-orphans 2>/dev/null || true
docker volume rm portainer_data 2>/dev/null || true
docker rmi -f custom-portainer-ce:lts 2>/dev/null || true
docker compose build --no-cache
docker compose up -d
