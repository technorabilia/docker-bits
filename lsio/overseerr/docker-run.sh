# [Overseerr](https://overseerr.dev/) is a request management and media
# discovery tool built to work with your existing Plex ecosystem.

. ./.env
docker run -d \
  --name=overseerr \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 5055:5055 `# Port for Overseerr's web interface.` \
  -v ${BASEDIR:-/volume1/docker}/overseerr/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/overseerr:latest
