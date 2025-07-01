# [DuckStation](https://duckstation.org/) is a PS1 Emulator aiming for the best
# accuracy and game support.

. ./.env
docker run -d \
  --name=duckstation \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP DuckStation desktop gui must be proxied.` \
  -p 3001:3001 `# HTTPS DuckStation desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/duckstation/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/duckstation:latest
