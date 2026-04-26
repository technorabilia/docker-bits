# [WineGUI](https://gitlab.melroy.org/melroy/winegui) is a user-interface
# friendly Wine manager that provides a graphical frontend for creating and
# managing Wine bottles.

. ./.env
docker run -d \
  --name=winegui \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP WineGUI, must be proxied.` \
  -p 3001:3001 `# HTTPS WineGUI.` \
  -v ${BASEDIR:-/srv/lsio}/winegui/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/winegui:latest
