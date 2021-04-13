This container needs special attention. Please check https://hub.docker.com/r/linuxserver/docker-compose for details.
source ./.env
docker run -d \
  --name=docker-compose \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/docker-compose/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/docker-compose
