# [Eden](https://eden-emu.dev/) is an experimental open-source emulator for the
# Nintendo Switch, built with performance and stability in mind.

. ./.env
docker run -d \
  --name=eden \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Eden desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# Eden desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/eden/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/eden:latest
