# [VLC Media Player](https://www.videolan.org/vlc/) is a free and open source
# cross-platform multimedia player and framework that delivers dependable
# performance across multiple devices.

. ./.env
docker run -d \
  --name=vlc \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e VLC_CLI=--no-qt-minimal-view `# Specify one or multiple VLC CLI flags, this string will be passed to the application in full. [OPTIONAL]` \
  -p 3000:3000 `# VLC Media Player desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# VLC Media Player desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/vlc/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/vlc:latest
