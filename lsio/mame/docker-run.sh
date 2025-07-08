# [MAME](https://www.mamedev.org/) is a free and open-source emulator designed
# to emulate the hardware of arcade games, video game consoles, old computers
# and other systems in software on modern personal computers.

. ./.env
docker run -d \
  --name=mame \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP MAME desktop gui, must be proxied.` \
  -p 3001:3001 `# HTTPS MAME desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/mame/config:/config `# Users home directory in the container, stores local files and settings` \
  -v ${BASEDIR:-/srv/lsio}/mame/mame:ro:/mame:ro `# MAME directory containing artwork, roms, and assets.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/mame:latest
