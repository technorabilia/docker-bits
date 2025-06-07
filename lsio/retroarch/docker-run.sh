# [RetroArch](https://retroarch.com/) is a frontend for emulators, game engines
# and media players. It enables you to run classic games on a wide range of
# computers and consoles through its slick graphical interface.

. ./.env
docker run -d \
  --name=retroarch \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Retroarch desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# Retroarch desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/retroarch/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/retroarch:latest
