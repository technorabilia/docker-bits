# [Znc](http://wiki.znc.in/ZNC) is an IRC network bouncer or BNC. It can detach
# the client from the actual IRC server, and also from selected channels.
# Multiple clients from different locations can connect to a single ZNC account
# simultaneously and therefore appear under the same nickname on IRC.

. ./.env
docker run -d \
  --name=znc \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 6501:6501 `# Port ZNC listens on.` \
  -v ${BASEDIR:-/volume1/docker}/znc/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/znc
