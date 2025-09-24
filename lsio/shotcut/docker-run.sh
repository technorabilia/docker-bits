# [Shotcut](https://www.shotcut.org/) is a free, open source, cross-platform
# video editor.

. ./.env
docker run -d \
  --name=shotcut \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Shotcut desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Shotcut desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/shotcut/config:/config `# Where Shotcut should store its config.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/shotcut:latest
