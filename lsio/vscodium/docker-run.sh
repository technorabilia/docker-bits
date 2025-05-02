# [VSCodium](https://vscodium.com/) is a community-driven, freely-licensed
# binary distribution of Microsoft’s editor VS Code.

. ./.env
docker run -d \
  --name=vscodium \
  --cap-add=IPC_LOCK \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# VSCodium desktop gui.` \
  -p 3001:3001 `# HTTPS VSCodium desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/vscodium/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/vscodium:latest
