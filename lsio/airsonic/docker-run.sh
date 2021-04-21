# [Airsonic](https://github.com/airsonic/airsonic) is a free, web-based media
# streamer, providing ubiquitious access to your music. Use it to share your
# music with friends, or to listen to your own music while at work. You can
# stream to multiple players simultaneously, for instance to one player in your
# kitchen and another in your living room.

source ./.env
docker run -d \
  --name=airsonic \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CONTEXT_PATH=<URL_BASE> `# optional` `# For setting url-base in reverse proxy setups.` \
  -e JAVA_OPTS=<options> `# optional` `# For passing additional java options.` \
  -p 4040:4040 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/airsonic/config:/config `# Configuration file location.` \
  -v ${BASEDIR:-/volume1/docker}/airsonic/music:/music `# Location of music.` \
  -v ${BASEDIR:-/volume1/docker}/airsonic/playlists:/playlists `# Location for playlists to be saved to.` \
  -v ${BASEDIR:-/volume1/docker}/airsonic/podcasts:/podcasts `# Location of podcasts.` \
  -v ${BASEDIR:-/volume1/docker}/airsonic/media:/media `# optional` `# Location of other media.` \
  --device /dev/snd:/dev/snd `# optional` `# Only needed to pass your host sound device to Airsonic's Java jukebox player.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/airsonic
