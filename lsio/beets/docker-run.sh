# [Beets](http://beets.io/) is a music library manager and not, for the most
# part, a music player. It does include a simple player plugin and an
# experimental Web-based player, but it generally leaves actual sound-
# reproduction to specialized tools.

. ./.env
docker run -d \
  --name=beets \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8337:8337 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/beets/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/beets/music:/music `# Music library` \
  -v ${BASEDIR:-/volume1/docker}/beets/downloads:/downloads `# Non processed music` \
  --restart unless-stopped \
  lscr.io/linuxserver/beets:latest
