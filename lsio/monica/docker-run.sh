# [Monica](https://github.com/monicahq/monica) is an open source personal
# relationship management system, that lets you document your life.

. ./.env
docker run -d \
  --name=monica \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DB_HOST= `# Mariadb DB server hostname.` \
  -e DB_PORT= `# Mariadb DB server port.` \
  -e DB_USERNAME= `# Mariadb DB user.` \
  -e DB_PASSWORD= `# Mariadb DB password.` \
  -e DB_DATABASE= `# Mariadb DB name.` \
  -e APP_URL=http://localhost:80 `# The URL you will use to access Monica including protocol, and port where appropriate. [OPTIONAL]` \
  -e TRUSTED_PROXIES= `# Set to the IP or netmask covering your reverse proxy, if running behind one. Set to `*` to trust all IPs (**do not** use `*` if exposed to the internet`). [OPTIONAL]` \
  -e APP_ENV=local `# Set to `production` when exposing the container to anyone else; this also makes https mandatory. [OPTIONAL]` \
  -e APP_DISABLE_SIGNUP=true `# Set to `false` to enable new account sign-ups. [OPTIONAL]` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/monica/config:/config `# Persistent config files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/monica:latest
