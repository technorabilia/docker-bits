# Thelounge (a fork of shoutIRC) is a web IRC client that you host on your own
# server.

source ./.env
docker run -d \
  --name=thelounge \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 9000:9000 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/thelounge/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/thelounge
