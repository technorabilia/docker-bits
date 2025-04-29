# [Ferdium](https://ferdium.org/) is a desktop app that helps you organize how
# you use your favourite apps by combining them into one application.

. ./.env
docker run -d \
  --name=ferdium \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Ferdium desktop gui.` \
  -p 3001:3001 `# Ferdium desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/ferdium/config:/config `# Users home directory in the container, stores program settings and files.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/ferdium:latest
