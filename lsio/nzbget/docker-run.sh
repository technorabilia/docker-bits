# [Nzbget](http://nzbget.net/) is a usenet downloader, written in C++ and
# designed with performance in mind to achieve maximum download speed by using
# very little system resources.

source ./.env
docker run -d \
  --name=nzbget \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e NZBGET_USER=nzbget `# optional` `# Specify the user for web authentication.` \
  -e NZBGET_PASS=tegbzn6789 `# optional` `# Specify the password for web authentication.` \
  -p 6789:6789 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/nzbget/config:/config `# NZBGet App data.` \
  -v ${BASEDIR:-/volume1/docker}/nzbget/downloads:/downloads `# optional` `# Location of downloads on disk.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/nzbget
