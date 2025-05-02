# [Wikijs](https://github.com/Requarks/wiki) A modern, lightweight and powerful
# wiki app built on NodeJS.

. ./.env
docker run -d \
  --name=wikijs \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DB_TYPE=sqlite `# Set to sqlite (default) or postgres depending on the database engine you wish to use [OPTIONAL]` \
  -e DB_HOST= `# DB hostname (postgres only) [OPTIONAL]` \
  -e DB_PORT= `# DB port (postgres only) [OPTIONAL]` \
  -e DB_NAME= `# DB name (postgres only) [OPTIONAL]` \
  -e DB_USER= `# DB username (postgres only) [OPTIONAL]` \
  -e DB_PASS= `# DB password (postgres only) [OPTIONAL]` \
  -p 3000:3000 `# Port for Wiki.js's web interface.` \
  -v ${BASEDIR:-/volume1/docker}/wikijs/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/wikijs/data:/data `# Where Wiki.js data is stored.` \
  --restart unless-stopped \
  lscr.io/linuxserver/wikijs:latest
