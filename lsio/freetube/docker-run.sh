# [FreeTube](https://freetubeapp.io/) is a feature-rich and user-friendly
# YouTube client with a focus on privacy.

. ./.env
docker run -d \
  --name=freetube \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# FreeTube desktop gui.` \
  -p 3001:3001 `# HTTPS FreeTube desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/freetube/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/freetube
