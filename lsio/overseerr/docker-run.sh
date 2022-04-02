# [Overseerr](https://overseerr.dev/) is a request management and media
# discovery tool built to work with your existing Plex ecosystem.

source ./.env
docker run -d \
  --name=overseerr \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 5055:5055 `# Port for Overseerr's web interface.` \
  -v ${BASEDIR:-/volume1/docker}/overseerr/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/overseerr
