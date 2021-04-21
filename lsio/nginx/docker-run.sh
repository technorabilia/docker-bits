# [Nginx](https://nginx.org/) is a simple webserver with php support. The config
# files reside in `/config` for easy user customization.

source ./.env
docker run -d \
  --name=nginx \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# http` \
  -p 443:443 `# https` \
  -v ${BASEDIR:-/volume1/docker}/nginx/config:/config `# Contains your www content and all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/nginx
