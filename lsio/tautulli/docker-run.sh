# [Tautulli](http://tautulli.com) is a python based web application for
# monitoring, analytics and notifications for Plex Media Server.

source ./.env
docker run -d \
  --name=tautulli \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8181:8181 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/tautulli/config:/config `# Contains tautulli config and database.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/tautulli
