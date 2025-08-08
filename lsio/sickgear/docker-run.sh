# [SickGear](https://github.com/sickgear/sickgear) provides management of TV
# shows and/or Anime, it detects new episodes, links downloader apps, and more..
# For more information on SickGear visit their website and check it out:
# https://github.com/SickGear/SickGear

. ./.env
docker run -d \
  --name=sickgear \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8081:8081 `# will map the container's port 8081 to port 8081 on the host` \
  -v ${BASEDIR:-/srv/lsio}/sickgear/config:/config `# Persistent config files.` \
  -v ${BASEDIR:-/srv/lsio}/sickgear/tv:/tv `# where you store your tv shows` \
  -v ${BASEDIR:-/srv/lsio}/sickgear/downloads:/downloads `# your downloads folder for post processing (must not be download in progress)` \
  --restart unless-stopped \
  lscr.io/linuxserver/sickgear:latest
