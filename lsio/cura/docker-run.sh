# [UltiMaker Cura](https://ultimaker.com/software/ultimaker-cura/) is free,
# easy-to-use 3D printing software trusted by millions of users. Fine-tune your
# 3D model with 400+ settings for the best slicing and printing results.

. ./.env
docker run -d \
  --name=cura \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Cura desktop gui.` \
  -p 3001:3001 `# Cura desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/cura/config:/config `# Users home directory in the container, stores program settings and files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/cura:latest
