# [Sickrage](https://sick-rage.github.io/) has been deprecated. Please use
# [linuxserver/sickchill](https://github.com/linuxserver/docker-sickchill)
# instead

source ./.env
docker run -d \
  --name=sickrage \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8081:8081 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/sickrage/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/sickrage/downloads:/downloads `# ISOs.` \
  -v ${BASEDIR:-/volume1/docker}/sickrage/tv:/tv `# TV library directory.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/sickrage
