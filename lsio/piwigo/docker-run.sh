# [Piwigo](http://piwigo.org/) is a photo gallery software for the web that
# comes with powerful features to publish and manage your collection of
# pictures.

source ./.env
docker run -d \
  --name=piwigo \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/piwigo/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/piwigo/gallery:/gallery `# Image storage for Piwigo` \
  --restart unless-stopped \
  ghcr.io/linuxserver/piwigo
