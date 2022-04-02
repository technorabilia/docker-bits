# [SickGear](https://github.com/sickgear/sickgear) provides management of TV
# shows and/or Anime, it detects new episodes, links downloader apps, and more..
# For more information on SickGear visit their website and check it out:
# https://github.com/SickGear/SickGear

source ./.env
docker run -d \
  --name=sickgear \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -p 8081:8081 `# will map the container's port 8081 to port 8081 on the host` \
  -v ${BASEDIR:-/volume1/docker}/sickgear/config:/config `# this will store any uploaded data on the docker host` \
  -v ${BASEDIR:-/volume1/docker}/sickgear/tv:/tv `# where you store your tv shows` \
  -v ${BASEDIR:-/volume1/docker}/sickgear/downloads:/downloads `# your downloads folder for post processing (must not be download in progress)` \
  --restart unless-stopped \
  ghcr.io/linuxserver/sickgear
