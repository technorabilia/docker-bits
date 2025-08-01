# [Krita](https://krita.org/en/) is a professional FREE and open source painting
# program. It is made by artists that want to see affordable art tools for
# everyone.

. ./.env
docker run -d \
  --name=krita \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP Krita desktop gui, must be proxied.` \
  -p 3001:3001 `# Krita desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/krita/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  lscr.io/linuxserver/krita:latest
