# [LibreOffice](https://www.libreoffice.org/) is a free and powerful office
# suite, and a successor to OpenOffice.org (commonly known as OpenOffice). Its
# clean interface and feature-rich tools help you unleash your creativity and
# enhance your productivity.

. ./.env
docker run -d \
  --name=libreoffice \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# LibreOffice desktop gui.` \
  -p 3001:3001 `# LibreOffice desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/libreoffice/config:/config `# Users home directory in the container, stores program settings and documents` \
  --restart unless-stopped \
  ghcr.io/linuxserver/libreoffice
