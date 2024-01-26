# [Piwigo](http://piwigo.org/) is a photo gallery software for the web that
# comes with powerful features to publish and manage your collection of
# pictures.

. ./.env
docker run -d \
  --name=piwigo \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/piwigo/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/piwigo/gallery:/gallery `# Image storage for Piwigo` \
  --restart unless-stopped \
  ghcr.io/linuxserver/piwigo
