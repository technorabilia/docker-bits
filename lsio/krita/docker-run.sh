# [Krita](https://krita.org/en/) is a professional FREE and open source painting
# program. It is made by artists that want to see affordable art tools for
# everyone.

. ./.env
docker run -d \
  --name=krita \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Krita desktop gui.` \
  -p 3001:3001 `# Krita desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/krita/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  lscr.io/linuxserver/krita:latest
