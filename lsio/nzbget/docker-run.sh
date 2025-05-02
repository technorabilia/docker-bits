# [Nzbget](http://nzbget.com/) is a usenet downloader, written in C++ and
# designed with performance in mind to achieve maximum download speed by using
# very little system resources.

. ./.env
docker run -d \
  --name=nzbget \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e NZBGET_USER=nzbget `# Specify the user for web authentication. [OPTIONAL]` \
  -e NZBGET_PASS=tegbzn6789 `# Specify the password for web authentication. [OPTIONAL]` \
  -p 6789:6789 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/nzbget/config:/config `# Persistent config` \
  -v ${BASEDIR:-/volume1/docker}/nzbget/downloads:/downloads `# Location of downloads on disk. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/nzbget:latest
