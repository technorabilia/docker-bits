# [PPSSPP](https://www.ppsspp.org/) is a free and open-source PSP emulator for
# Windows, macOS, Linux, iOS, Android, Nintendo Wii U, Nintendo Switch,
# BlackBerry 10, MeeGo, Pandora, Xbox Series and Symbian with a focus on speed
# and portability.

. ./.env
docker run -d \
  --name=ppsspp \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# PPSSPP desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# PPSSPP desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/ppsspp/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" `# [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/ppsspp:latest
