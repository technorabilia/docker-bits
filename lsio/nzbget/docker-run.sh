# [Nzbget](http://nzbget.net/) is a usenet downloader, written in C++ and
# designed with performance in mind to achieve maximum download speed by using
# very little system resources.

source ./.env
docker run -d \
  --name=nzbget \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e VERSION=latest `# optional` `# Supported values are LATEST, PLEXPASS or a specific version number.` \
  -p 6789:6789 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/nzbget/config:/config `# NZBGet App data.` \
  -v ${BASEDIR:-/volume1/docker}/nzbget/downloads:/downloads `# optional` `# Location of downloads on disk.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/nzbget
