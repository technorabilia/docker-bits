# [{{ project_name_short|capitalize }}](https://url.com/) short description goes
# here.

source ./.env
docker run -d \
  --name=name \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/name/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/name
