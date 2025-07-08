# [GZDoom](https://gzdoom.app/) is a feature centric port for all Doom engine
# games, based on ZDoom, adding an OpenGL renderer and powerful scripting
# capabilities.

. ./.env
docker run -d \
  --name=gzdoom \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP GZDoom desktop gui must be proxied.` \
  -p 3001:3001 `# HTTPS GZDoom desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/gzdoom/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/gzdoom:latest
