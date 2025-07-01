# [Ardour](https://ardour.org/) is an open source, collaborative effort of a
# worldwide team including musicians, programmers, and professional recording
# engineers.

. ./.env
docker run -d \
  --name=ardour \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SUBFOLDER=/ `# Specify a subfolder to use with reverse proxies, IE `/subfolder/` [OPTIONAL]` \
  -p 3000:3000 `# Ardour desktop gui [OPTIONAL]` \
  -p 3001:3001 `# Ardour desktop gui HTTPS [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/ardour/config:/config `# Users home directory in the container, stores data and application config files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/ardour:latest
