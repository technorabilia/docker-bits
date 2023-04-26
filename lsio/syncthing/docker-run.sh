# [Syncthing](https://syncthing.net) replaces proprietary sync and cloud
# services with something open, trustworthy and decentralized. Your data is your
# data alone and you deserve to choose where it is stored, if it is shared with
# some third party and how it's transmitted over the Internet.

. ./.env
docker run -d \
  --name=syncthing \
    --hostname={{ project_name }} `# optional` `# Optionally the hostname can be defined.` \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8384:8384 `# Application WebUI` \
  -p 22000:22000/tcp `# Listening port (TCP)` \
  -p 22000:22000/udp `# Listening port (UDP)` \
  -p 21027:21027/udp `# Protocol discovery` \
  -v ${BASEDIR:-/volume1/docker}/syncthing/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/syncthing/data1:/data1 `# Data1` \
  -v ${BASEDIR:-/volume1/docker}/syncthing/data2:/data2 `# Data2` \
  --restart unless-stopped \
  ghcr.io/linuxserver/syncthing
