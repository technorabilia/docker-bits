# [Paperless-ngx](https://github.com/paperless-ngx/paperless-ngx) is an
# application by Daniel Quinn and contributors that indexes your scanned
# documents and allows you to easily search for documents and store metadata
# alongside your documents.'

source ./.env
docker run -d \
  --name=paperless-ngx \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e REDIS_URL= `# optional` `# Specify an external redis instance to use. Can optionally include a port (`redis:6379`) and/or db (`redis/foo`). If left blank or not included, will use a built-in redis instance. If changed after initial setup will also require manual modification of /config/settings.py` \
  -p 8000:8000 `# http gui` \
  -v ${BASEDIR:-/volume1/docker}/paperless-ngx/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/paperless-ngx/data:/data `# Storage location for all paperless-ngx data files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/paperless-ngx
