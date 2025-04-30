# [OpenShot](https://openshot.org/) Video Editor is an award-winning free and
# open-source video editor for Linux, Mac, and Windows, and is dedicated to
# delivering high quality video editing and animation solutions to the world.

. ./.env
docker run -d \
  --name=openshot \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# OpenShot desktop gui.` \
  -p 3001:3001 `# OpenShot desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/openshot/config:/config `# User's home directory in the container, stores program settings and files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/openshot:latest
