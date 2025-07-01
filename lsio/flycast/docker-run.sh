# [Flycast](https://github.com/flyinghead/flycast) is a multi-platform Sega
# Dreamcast, Naomi, Naomi 2, and Atomiswave emulator derived from reicast.

. ./.env
docker run -d \
  --name=flycast \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP Flycast desktop gui must be proxied.` \
  -p 3001:3001 `# HTTPS Flycast desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/flycast/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/flycast:latest
