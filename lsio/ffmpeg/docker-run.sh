# This container needs special attention. Please check https://hub.docker.com/r/linuxserver/ffmpeg for details.
. ./.env
docker run -d \
  --name=ffmpeg \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/srv/lsio}/ffmpeg/config:/config `# Configuration files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/ffmpeg:latest
