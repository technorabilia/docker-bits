# THIS IMAGE IS DEPRECATED. PLEASE USE AIRSONIC `linuxserver/airsonic`
# Libresonic is a free, web-based media streamer, providing ubiqutious access to
# your music. Use it to share your music with friends, or to listen to your own
# music while at work. You can stream to multiple players simultaneously, for
# instance to one player in your kitchen and another in your living room.

source ./.env
docker run -d \
  --name=libresonic \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CONTEXT_PATH=<URL_BASE> `# optional` `# For setting url-base in reverse proxy setups.` \
  -p 4040:4040 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/libresonic/config:/config `# Configuration file location.` \
  -v ${BASEDIR:-/volume1/docker}/libresonic/music:/music `# Location of music.` \
  -v ${BASEDIR:-/volume1/docker}/libresonic/playlists:/playlists `# Location for playlists to be saved to.` \
  -v ${BASEDIR:-/volume1/docker}/libresonic/podcasts:/podcasts `# Location of podcasts.` \
  -v ${BASEDIR:-/volume1/docker}/libresonic/media:/media `# optional` `# Location of other media.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/libresonic
