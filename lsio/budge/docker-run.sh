# [Budge](https://github.com/linuxserver/budge) is an open source 'budgeting
# with envelopes' personal finance app.

. ./.env
docker run -d \
  --name=budge \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/budge/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/budge:latest
