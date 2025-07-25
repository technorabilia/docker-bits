# [Grav](https://github.com/getgrav/grav/) is a Fast, Simple, and Flexible,
# file-based Web-platform.

. ./.env
docker run -d \
  --name=grav \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Port for web frontend` \
  -v ${BASEDIR:-/srv/lsio}/grav/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/grav:latest
