# Embystat is a personal web server that can calculate all kinds of statistics
# from your (local) Emby server. Just install this on your server and let him
# calculate all kinds of fun stuff.

source ./.env
docker run -d \
  --name=embystat \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 6555:6555 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/embystat/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/embystat
