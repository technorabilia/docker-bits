# [Nzbget](http://nzbget.com/) is a usenet downloader, written in C++ and
# designed with performance in mind to achieve maximum download speed by using
# very little system resources.

. ./.env
docker run -d \
  --name=nzbget \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e NZBGET_USER=nzbget `# optional` `# Specify the user for web authentication.` \
  -e NZBGET_PASS=tegbzn6789 `# optional` `# Specify the password for web authentication.` \
  -p 6789:6789 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/nzbget/config:/config `# Persistent config` \
  -v ${BASEDIR:-/volume1/docker}/nzbget/downloads:/downloads `# optional` `# Location of downloads on disk.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/nzbget
