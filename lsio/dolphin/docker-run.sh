# [Dolphin Emulator](https://dolphin-emu.org/) lets you play GameCube and Wii
# games with various graphical enhancements and other features are available to
# improve your game experience.

. ./.env
docker run -d \
  --name=dolphin \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Dolphin desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# Dolphin desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/dolphin/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  lscr.io/linuxserver/dolphin:latest
