# [Vivaldi](https://vivaldi.com/) is a Norwegian freeware, cross-platform web
# browser with a built-in email client developed by Vivaldi Technologies.

. ./.env
docker run -d \
  --name=vivaldi \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e VIVALDI_CLI=https://www.linuxserver.io/ `# Specify one or multiple Vivaldi CLI flags, this string will be passed to the application in full. [OPTIONAL]` \
  -p 3000:3000 `# HTTP Vivaldi desktop gui, must be proxied.` \
  -p 3001:3001 `# HTTPS Vivaldi desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/vivaldi/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/vivaldi:latest
