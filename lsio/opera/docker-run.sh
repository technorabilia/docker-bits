# [Opera](https://www.opera.com/) is a multi-platform web browser developed by
# its namesake company Opera. The browser is based on Chromium, but
# distinguishes itself from other Chromium-based browsers (Chrome, Edge, etc.)
# through its user interface and other features.

. ./.env
docker run -d \
  --name=opera \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e OPERA_CLI=https://www.linuxserver.io/ `# optional` `# Specify one or multiple Chromium CLI flags, this string will be passed to the application in full.` \
  -p 3000:3000 `# Opera desktop gui.` \
  -p 3001:3001 `# HTTPS Opera desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/opera/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/opera
