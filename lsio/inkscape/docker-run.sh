# [Inkscape](https://inkscape.org/) is professional quality vector graphics
# software which runs on Linux, Mac OS X and Windows desktop computers.

. ./.env
docker run -d \
  --name=inkscape \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Inkscape desktop gui.` \
  -p 3001:3001 `# Inkscape desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/inkscape/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  lscr.io/linuxserver/inkscape:latest
