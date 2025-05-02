# [Mstream](https://mstream.io/) is a personal music streaming server. You can
# use mStream to stream your music from your home computer to any device,
# anywhere. There are mobile apps available for both Android and iPhone.

. ./.env
docker run -d \
  --name=mstream \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# The port for the mStream web interface` \
  -v ${BASEDIR:-/volume1/docker}/mstream/config:/config `# mStream config` \
  -v ${BASEDIR:-/volume1/docker}/mstream/music:/music `# Music location` \
  --restart unless-stopped \
  lscr.io/linuxserver/mstream:latest
