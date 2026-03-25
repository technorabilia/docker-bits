# [shadPS4](https://shadps4.net/) is an early PlayStation 4 emulator for
# Windows, Linux and macOS written in C++.

. ./.env
docker run -d \
  --name=shadps4 \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# shadPS4 desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# shadPS4 desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/shadps4/config:/config `# Users home directory in the container, stores all files and games.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/shadps4:latest
