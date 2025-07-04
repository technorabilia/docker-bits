# [Sickchill](https://github.com/SickChill/SickChill) is an Automatic Video
# Library Manager for TV Shows. It watches for new episodes of your favorite
# shows, and when they are posted it does its magic.

. ./.env
docker run -d \
  --name=sickchill \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8081:8081 `# will map the container's port 8081 to port 8081 on the host` \
  -v ${BASEDIR:-/srv/lsio}/sickchill/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/srv/lsio}/sickchill/downloads:/downloads `# this will store any downloaded data on the docker host [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/sickchill/tv:/tv `# this will allow sickchill to view what you already have [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/sickchill:latest
