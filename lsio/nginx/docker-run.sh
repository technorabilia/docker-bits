# [Nginx](https://nginx.org/) is a simple webserver with php support. The config
# files reside in `/config` for easy user customization.

. ./.env
docker run -d \
  --name=nginx \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# http` \
  -p 443:443 `# https` \
  -v ${BASEDIR:-/volume1/docker}/nginx/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/nginx:latest
