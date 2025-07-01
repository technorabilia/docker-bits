# [digiKam](https://www.digikam.org/): Professional Photo Management with the
# Power of Open Source

. ./.env
docker run -d \
  --name=digikam \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SUBFOLDER=/ `# Specify a subfolder to use with reverse proxies, IE `/subfolder/` [OPTIONAL]` \
  -p 3000:3000 `# digiKam desktop gui [OPTIONAL]` \
  -p 3001:3001 `# digiKam desktop gui HTTPS [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/digikam/config:/config `# Users home directory in the container, stores database.` \
  --restart unless-stopped \
  lscr.io/linuxserver/digikam:latest
