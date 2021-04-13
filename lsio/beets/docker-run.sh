# Beets is a music library manager and not, for the most part, a music player.
# It does include a simple player plugin and an experimental Web-based player,
# but it generally leaves actual sound-reproduction to specialized tools.

source ./.env
docker run -d \
  --name=beets \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8337:8337 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/beets/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/beets/music:/music `# Music library` \
  -v ${BASEDIR:-/volume1/docker}/beets/downloads:/downloads `# Non processed music` \
  --restart unless-stopped \
  ghcr.io/linuxserver/beets
