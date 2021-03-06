# [Chevereto](https://github.com/rodber/chevereto-free) is an image hosting
# software that allows you to create a beautiful and full-featured image hosting
# website on your own server. It's your hosting and your rules, so say goodbye
# to closures and restrictions.

source ./.env
docker run -d \
  --name=chevereto \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/chevereto/config:/config `# config directory volume mapping` \
  -v ${BASEDIR:-/volume1/docker}/chevereto/data:/data `# data directory volume mapping` \
  --restart unless-stopped \
  ghcr.io/linuxserver/chevereto
