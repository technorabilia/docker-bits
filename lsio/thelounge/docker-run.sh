# [Thelounge](https://thelounge.github.io/) (a fork of shoutIRC) is a web IRC
# client that you host on your own server.

source ./.env
docker run -d \
  --name=thelounge \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 9000:9000 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/thelounge/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/thelounge
