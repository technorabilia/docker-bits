# [Ardour](https://ardour.org/) is an open source, collaborative effort of a
# worldwide team including musicians, programmers, and professional recording
# engineers.

. ./.env
docker run -d \
  --name=ardour \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder to use with reverse proxies, IE `/subfolder/`` \
  -p 3000:3000 `# optional` `# Ardour desktop gui` \
  -p 3001:3001 `# optional` `# Ardour desktop gui HTTPS` \
  -v ${BASEDIR:-/volume1/docker}/ardour/config:/config `# Users home directory in the container, stores data and application config files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/ardour
