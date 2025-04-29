# This container needs special attention. Please check https://hub.docker.com/r/linuxserver/qemu-static for details.
. ./.env
docker run -d \
  --name=qemu-static \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/qemu-static/config:/config `# Configuration files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/qemu-static:latest
