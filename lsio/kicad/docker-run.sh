# [KiCad](https://www.kicad.org/) - A Cross Platform and Open Source Electronics
# Design Automation Suite.

. ./.env
docker run -d \
  --name=kicad \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# KiCad desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# KiCad desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/kicad/config:/config `# Users home directory in the container, stores program settings and files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/kicad:latest
