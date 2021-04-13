# Photoshow is gallery software at its easiest, it doesn't even require a
# database.

source ./.env
docker run -d \
  --name=photoshow \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/photoshow/config:/config `# Stores config and logs for nginx base.` \
  -v ${BASEDIR:-/volume1/docker}/photoshow/Pictures:ro:/Pictures:ro `# Your local folder of photos you wish to share.` \
  -v ${BASEDIR:-/volume1/docker}/photoshow/Thumbs:/Thumbs `# Local folder to store thumbnails of your images.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/photoshow
