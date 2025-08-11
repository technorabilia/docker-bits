# [ONLYOFFICE](https://www.onlyoffice.com/) provides a full range of tools to
# create, edit and collaborate on text documents, spreadsheets, presentations,
# PDF forms and regular PDF files on web, desktop and mobile platforms.

. ./.env
docker run -d \
  --name=onlyoffice \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# ONLYOFFICE desktop gui, must be proxied.` \
  -p 3001:3001 `# ONLYOFFICE desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/onlyoffice/config:/config `# Users home directory in the container, stores program settings and documents` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/onlyoffice:latest
