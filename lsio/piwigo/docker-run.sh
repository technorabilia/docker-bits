# [Piwigo](http://piwigo.org/) is a photo gallery software for the web that
# comes with powerful features to publish and manage your collection of
# pictures.

. ./.env
docker run -d \
  --name=piwigo \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/srv/lsio}/piwigo/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/srv/lsio}/piwigo/gallery:/gallery `# Image storage for Piwigo` \
  --restart unless-stopped \
  lscr.io/linuxserver/piwigo:latest
