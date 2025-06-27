# [xemu](https://xemu.app/) is a free and open-source application that emulates
# the original Microsoft Xbox game console, enabling people to play their
# original Xbox games on Windows, macOS, and Linux systems.

. ./.env
docker run -d \
  --name=xemu \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP xemu desktop gui must be proxied.` \
  -p 3001:3001 `# HTTPS xemu desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/xemu/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/xemu:latest
