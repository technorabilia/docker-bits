# [PCSX2](https://pcsx2.net/) is an open source PS2 Emulator.

. ./.env
docker run -d \
  --name=pcsx2 \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP PCSX2 desktop gui must be proxied.` \
  -p 3001:3001 `# HTTPS PCSX2 desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/pcsx2/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/pcsx2:latest
