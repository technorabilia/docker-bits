# [LibreOffice](https://www.libreoffice.org/) is a free and powerful office
# suite, and a successor to OpenOffice.org (commonly known as OpenOffice). Its
# clean interface and feature-rich tools help you unleash your creativity and
# enhance your productivity.

. ./.env
docker run -d \
  --name=libreoffice \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# LibreOffice desktop gui.` \
  -p 3001:3001 `# LibreOffice desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/libreoffice/config:/config `# Users home directory in the container, stores program settings and documents` \
  --restart unless-stopped \
  lscr.io/linuxserver/libreoffice:latest
