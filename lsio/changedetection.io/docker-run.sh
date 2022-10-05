# [Changedetection.io](https://github.com/dgtlmoon/changedetection.io) provides
# free, open-source web page monitoring, notification and change detection.

source ./.env
docker run -d \
  --name=changedetection.io \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e BASE_URL= `# optional` `# Specify the full URL (including protocol) when running behind a reverse proxy` \
  -p 5000:5000 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/changedetection.io/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/changedetection.io