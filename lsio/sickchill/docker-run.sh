# [Sickchill](https://github.com/SickChill/SickChill) is an Automatic Video
# Library Manager for TV Shows. It watches for new episodes of your favorite
# shows, and when they are posted it does its magic.

. ./.env
docker run -d \
  --name=sickchill \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8081:8081 `# will map the container's port 8081 to port 8081 on the host` \
  -v ${BASEDIR:-/volume1/docker}/sickchill/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/sickchill/downloads:/downloads `# optional` `# this will store any downloaded data on the docker host` \
  -v ${BASEDIR:-/volume1/docker}/sickchill/tv:/tv `# optional` `# this will allow sickchill to view what you already have` \
  --restart unless-stopped \
  ghcr.io/linuxserver/sickchill
