# Papermerge is an open source document management system (DMS) primarily
# designed for archiving and retrieving your digital documents. Instead of
# having piles of paper documents all over your desk, office or drawers - you
# can quickly scan them and configure your scanner to directly upload to
# Papermerge DMS."

source ./.env
docker run -d \
  --name=papermerge \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -e REDIS_URL= `# optional` `# Specify an external redis instance to use. Can optionally include a port (`redis:6379`) and/or db (`redis/foo`). If left blank or not included, will use a built-in redis instance. If changed after initial setup will also require manual modification of /config/settings.py` \
  -p 8000:8000 `# http gui` \
  -v ${BASEDIR:-/volume1/docker}/papermerge/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/papermerge/data:/data `# Storage location for all papermerge data files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/papermerge
