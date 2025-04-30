# [KiCad](https://www.kicad.org/) - A Cross Platform and Open Source Electronics
# Design Automation Suite.

. ./.env
docker run -d \
  --name=kicad \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# KiCad desktop gui.` \
  -p 3001:3001 `# KiCad desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/kicad/config:/config `# Users home directory in the container, stores program settings and files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/kicad:latest
