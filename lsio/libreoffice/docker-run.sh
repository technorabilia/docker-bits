# [LibreOffice](https://www.libreoffice.org/) is a free and powerful office
# suite, and a successor to OpenOffice.org (commonly known as OpenOffice). Its
# clean interface and feature-rich tools help you unleash your creativity and
# enhance your productivity.

source ./.env
docker run -d \
  --name=libreoffice \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# LibreOffice desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/libreoffice/config:/config `# Users home directory in the container, stores program settings and documents` \
  --restart unless-stopped \
  ghcr.io/linuxserver/libreoffice
