# [Audacity](https://www.audacityteam.org/) is an easy-to-use, multi-track audio
# editor and recorder. Developed by a group of volunteers as open source.

. ./.env
docker run -d \
  --name=audacity \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Audacity desktop gui.` \
  -p 3001:3001 `# Audacity desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/audacity/config:/config `# Users home directory in the container, stores program settings and images` \
  --restart unless-stopped \
  ghcr.io/linuxserver/audacity
