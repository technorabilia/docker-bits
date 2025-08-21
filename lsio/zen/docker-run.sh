# [Zen Browser](https://zen-browser.app/) is a free and open-source fork of
# Mozilla Firefox with a focus on privacy, customizability and design.

. ./.env
docker run -d \
  --name=zen \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Zen desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Zen desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/zen/config:/config `# Users home directory in the container, stores program settings and files.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/zen:latest
