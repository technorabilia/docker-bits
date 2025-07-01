# [Calligra](https://calligra.org/) is an office and graphic art suite by KDE.
# It is available for desktop PCs, tablet computers, and smartphones. It
# contains applications for word processing, spreadsheets, presentation, vector
# graphics, and editing databases.

. ./.env
docker run -d \
  --name=calligra \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Calligra desktop gui.` \
  -p 3001:3001 `# Calligra desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/calligra/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  lscr.io/linuxserver/calligra:latest
