# [Limnoria](https://github.com/ProgVal/limnoria) A robust, full-featured, and
# user/programmer-friendly Python IRC bot, with many existing plugins. Successor
# of the well-known Supybot.

. ./.env
docker run -d \
  --name=limnoria \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8080:8080 `# Port for Limnoria's web interface.` \
  -v ${BASEDIR:-/srv/lsio}/limnoria/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/limnoria:latest
