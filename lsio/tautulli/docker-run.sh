# [Tautulli](http://tautulli.com) is a python based web application for
# monitoring, analytics and notifications for Plex Media Server.

. ./.env
docker run -d \
  --name=tautulli \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8181:8181 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/tautulli/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/tautulli
