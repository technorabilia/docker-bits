# [Shotcut](https://www.shotcut.org/) is a free, open source, cross-platform
# video editor.

. ./.env
docker run -d \
  --name=shotcut \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Shotcut desktop gui.` \
  -p 3001:3001 `# Shotcut desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/shotcut/config:/config `# Where Shotcut should store its config.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/shotcut
