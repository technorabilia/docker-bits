# [Microsoft Edge](https://www.microsoft.com/edge) is a cross-platform web
# browser developed by Microsoft and based on Chromium.

. ./.env
docker run -d \
  --name=msedge \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e EDGE_CLI=https://www.linuxserver.io/ `# Specify one or multiple Chromium CLI flags, this string will be passed to the application in full. [OPTIONAL]` \
  -p 3000:3000 `# Edge desktop gui.` \
  -p 3001:3001 `# HTTPS Edge desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/msedge/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/msedge:latest
