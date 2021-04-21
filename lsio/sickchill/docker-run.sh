# [Sickchill](https://github.com/SickChill/SickChill) is an Automatic Video
# Library Manager for TV Shows. It watches for new episodes of your favorite
# shows, and when they are posted it does its magic.

source ./.env
docker run -d \
  --name=sickchill \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8081:8081 `# will map the container's port 8081 to port 8081 on the host` \
  -v ${BASEDIR:-/volume1/docker}/sickchill/config:/config `# this will store config on the docker host` \
  -v ${BASEDIR:-/volume1/docker}/sickchill/downloads:/downloads `# this will store any downloaded data on the docker host` \
  -v ${BASEDIR:-/volume1/docker}/sickchill/tv:/tv `# this will allow sickchill to view what you already have` \
  --restart unless-stopped \
  ghcr.io/linuxserver/sickchill
