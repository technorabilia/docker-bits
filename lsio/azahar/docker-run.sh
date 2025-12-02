# [Azahar](https://azahar-emu.org/) is an open-source 3DS emulator based on
# Citra.

. ./.env
docker run -d \
  --name=azahar \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Azahar desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# Azahar desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/azahar/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/azahar:latest
