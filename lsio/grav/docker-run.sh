# [Grav](https://github.com/getgrav/grav/) is a Fast, Simple, and Flexible,
# file-based Web-platform.

source ./.env
docker run -d \
  --name=grav \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# Port for web frontend` \
  -v ${BASEDIR:-/volume1/docker}/grav/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/grav
