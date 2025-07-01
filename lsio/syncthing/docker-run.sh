# [Syncthing](https://syncthing.net) replaces proprietary sync and cloud
# services with something open, trustworthy and decentralized. Your data is your
# data alone and you deserve to choose where it is stored, if it is shared with
# some third party and how it's transmitted over the Internet.

. ./.env
docker run -d \
  --name=syncthing \
    --hostname={{ project_name }} `# Optionally the hostname can be defined. [OPTIONAL]` \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8384:8384 `# Application WebUI` \
  -p 22000:22000/tcp `# Listening port (TCP)` \
  -p 22000:22000/udp `# Listening port (UDP)` \
  -p 21027:21027/udp `# Protocol discovery` \
  -v ${BASEDIR:-/srv/lsio}/syncthing/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/srv/lsio}/syncthing/data1:/data1 `# Data1` \
  -v ${BASEDIR:-/srv/lsio}/syncthing/data2:/data2 `# Data2` \
  --restart unless-stopped \
  lscr.io/linuxserver/syncthing:latest
