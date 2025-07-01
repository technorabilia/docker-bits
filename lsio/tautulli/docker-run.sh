# [Tautulli](http://tautulli.com) is a python based web application for
# monitoring, analytics and notifications for Plex Media Server.

. ./.env
docker run -d \
  --name=tautulli \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8181:8181 `# WebUI` \
  -v ${BASEDIR:-/srv/lsio}/tautulli/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/tautulli:latest
