# [RawTherapee](https://rawtherapee.com/) is a free, cross-platform raw image
# processing program!

. ./.env
docker run -d \
  --name=rawtherapee \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# RawTherapee desktop gui.` \
  -p 3001:3001 `# RawTherapee desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/rawtherapee/config:/config `# User's home directory in the container, stores program settings and files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/rawtherapee:latest
