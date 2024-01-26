# [pyLoad](https://pyload.net/) is a Free and Open Source download manager
# written in Python and designed to be extremely lightweight, easily extensible
# and fully manageable via web.

. ./.env
docker run -d \
  --name=pyload-ng \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8000:8000 `# Allows HTTP access to the application` \
  -p 9666:9666 `# optional` `# Click'n'Load port.` \
  -v ${BASEDIR:-/volume1/docker}/pyload-ng/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/pyload-ng/downloads:/downloads `# Destination of pyLoad downloads` \
  --restart unless-stopped \
  ghcr.io/linuxserver/pyload-ng
