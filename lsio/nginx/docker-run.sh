# [Nginx](https://nginx.org/) is a simple webserver with php support. The config
# files reside in `/config` for easy user customization.

. ./.env
docker run -d \
  --name=nginx \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e NGINX_AUTORELOAD= `# Set to `true` to enable automatic reloading of confs on change without stopping/restarting nginx. Your filesystem must support inotify. This functionality was previously offered [via mod](https://github.com/linuxserver/docker-mods/tree/swag-auto-reload). [OPTIONAL]` \
  -e NGINX_AUTORELOAD_WATCHLIST= `# A [pipe](https://en.wikipedia.org/wiki/Vertical_bar)-separated list of additional folders for auto reload to watch in addition to `/config/nginx` [OPTIONAL]` \
  -p 80:80 `# http` \
  -p 443:443 `# https` \
  -v ${BASEDIR:-/srv/lsio}/nginx/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/nginx:latest
