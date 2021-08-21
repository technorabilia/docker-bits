# [Prowlarr](https://github.com/prowlarr/prowlarr) - Prowlarr is a indexer
# manager/proxy to integrate with your various PVR apps.

source ./.env
docker run -d \
  --name=prowlarr \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 9696:9696 `# The port for the Prowlarr webinterface` \
  -v ${BASEDIR:-/volume1/docker}/prowlarr/config:/config `# Database and Radarr configs` \
  --restart unless-stopped \
  ghcr.io/linuxserver/prowlarr
