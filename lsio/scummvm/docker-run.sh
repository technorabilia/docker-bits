# [ScummVM](https://www.scummvm.org/) is a program which allows you to run
# certain classic graphical adventure and role-playing games, provided you
# already have their data files. The clever part about this: ScummVM just
# replaces the executables shipped with the games, allowing you to play them on
# systems for which they were never designed! ScummVM is a complete rewrite of
# these games' executables and is not an emulator.

. ./.env
docker run -d \
  --name=scummvm \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP ScummVM desktop gui must be proxied.` \
  -p 3001:3001 `# HTTPS ScummVM desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/scummvm/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  lscr.io/linuxserver/scummvm:latest
