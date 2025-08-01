# [Overseerr](https://overseerr.dev/) is a request management and media
# discovery tool built to work with your existing Plex ecosystem.

. ./.env
docker run -d \
  --name=overseerr \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 5055:5055 `# Port for Overseerr's web interface.` \
  -v ${BASEDIR:-/srv/lsio}/overseerr/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/overseerr:latest
