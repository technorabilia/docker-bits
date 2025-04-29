# [Chromium](https://www.chromium.org/chromium-projects/) is an open-source
# browser project that aims to build a safer, faster, and more stable way for
# all users to experience the web.

. ./.env
docker run -d \
  --name=chromium \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CHROME_CLI=https://www.linuxserver.io/ `# optional` `# Specify one or multiple Chromium CLI flags, this string will be passed to the application in full.` \
  -p 3000:3000 `# Chromium desktop gui.` \
  -p 3001:3001 `# HTTPS Chromium desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/chromium/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/chromium:latest
