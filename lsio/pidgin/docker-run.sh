# [Pidgin](https://pidgin.im/) is a chat program which lets you log into
# accounts on multiple chat networks simultaneously. This means that you can be
# chatting with friends on XMPP and sitting in an IRC channel at the same time.

. ./.env
docker run -d \
  --name=pidgin \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Pidgin desktop gui.` \
  -p 3001:3001 `# Pidgin desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/pidgin/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  ghcr.io/linuxserver/pidgin
