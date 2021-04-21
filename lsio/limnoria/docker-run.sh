# [Limnoria](https://github.com/ProgVal/limnoria) A robust, full-featured, and
# user/programmer-friendly Python IRC bot, with many existing plugins. Successor
# of the well-known Supybot.

source ./.env
docker run -d \
  --name=limnoria \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8080:8080 `# Port for Limnoria's web interface.` \
  -v ${BASEDIR:-/volume1/docker}/limnoria/config:/config `# Where Limnoria config is stored.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/limnoria
