# [Xbackbone](https://github.com/SergiX44/XBackBone) is a simple, self-hosted,
# lightweight PHP file manager that support the instant sharing tool ShareX and
# *NIX systems. It supports uploading and displaying images, GIF, video, code,
# formatted text, and file downloading and uploading. Also have a web UI with
# multi user management, past uploads history and search support.

source ./.env
docker run -d \
  --name=xbackbone \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/xbackbone/config:/config `# config directory volume mapping` \
  --restart unless-stopped \
  ghcr.io/linuxserver/xbackbone
