# [Airsonic-advanced](https://github.com/kagemomiji/airsonic-advanced) is a
# free, web-based media streamer, providing ubiquitious access to your music.
# Use it to share your music with friends, or to listen to your own music while
# at work. You can stream to multiple players simultaneously, for instance to
# one player in your kitchen and another in your living room.

. ./.env
docker run -d \
  --name=airsonic-advanced \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CONTEXT_PATH= `# For setting url-base in reverse proxy setups. [OPTIONAL]` \
  -e JAVA_OPTS= `# For passing additional java options. [OPTIONAL]` \
  -p 4040:4040 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/airsonic-advanced/config:/config `# Configuration file location.` \
  -v ${BASEDIR:-/volume1/docker}/airsonic-advanced/music:/music `# Location of music.` \
  -v ${BASEDIR:-/volume1/docker}/airsonic-advanced/playlists:/playlists `# Location for playlists to be saved to.` \
  -v ${BASEDIR:-/volume1/docker}/airsonic-advanced/podcasts:/podcasts `# Location of podcasts.` \
  -v ${BASEDIR:-/volume1/docker}/airsonic-advanced/media:/media `# Location of other media. [OPTIONAL]` \
  --device /dev/snd:/dev/snd `# Only needed to pass your host sound device to Airsonic's Java jukebox player. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/airsonic-advanced:latest
