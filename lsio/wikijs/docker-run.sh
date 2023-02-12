# [Wikijs](https://github.com/Requarks/wiki) A modern, lightweight and powerful
# wiki app built on NodeJS.

source ./.env
docker run -d \
  --name=wikijs \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# Port for Wiki.js's web interface.` \
  -v ${BASEDIR:-/volume1/docker}/wikijs/config:/config `# Where Wiki.js config is stored.` \
  -v ${BASEDIR:-/volume1/docker}/wikijs/data:/data `# Where Wiki.js data is stored.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/wikijs
