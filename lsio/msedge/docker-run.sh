# [Microsoft Edge](https://www.microsoft.com/edge) is a cross-platform web
# browser developed by Microsoft and based on Chromium.

. ./.env
docker run -d \
  --name=msedge \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e EDGE_CLI=https://www.linuxserver.io/ `# optional` `# Specify one or multiple Chromium CLI flags, this string will be passed to the application in full.` \
  -p 3000:3000 `# Edge desktop gui.` \
  -p 3001:3001 `# HTTPS Edge desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/msedge/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/msedge
