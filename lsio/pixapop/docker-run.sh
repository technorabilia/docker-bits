# Pixapop is an open-source single page application to view your photos in the
# easiest way possible.

source ./.env
docker run -d \
  --name=pixapop \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e APP_USERNAME=admin `# optional` `# Specify a username to enable authentication.` \
  -e APP_PASSWORD=admin `# optional` `# Specify a password to enable authentication.` \
  -p 80:80 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/pixapop/config:/config `# Stores config and logs for nginx base.` \
  -v ${BASEDIR:-/volume1/docker}/pixapop/photos:/photos `# Your local folder of photos.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/pixapop
