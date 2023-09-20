# [Series Troxide](https://github.com/MaarifaMaarifa/series-troxide) a Simple
# and Modern Series Tracker

. ./.env
docker run -d \
  --name=series-troxide \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Series Troxide desktop gui.` \
  -p 3001:3001 `# HTTPS Series Troxide desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/series-troxide/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/series-troxide
