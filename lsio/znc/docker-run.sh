# [Znc](http://wiki.znc.in/ZNC) is an IRC network bouncer or BNC. It can detach
# the client from the actual IRC server, and also from selected channels.
# Multiple clients from different locations can connect to a single ZNC account
# simultaneously and therefore appear under the same nickname on IRC.

. ./.env
docker run -d \
  --name=znc \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 6501:6501 `# Port ZNC listens on.` \
  -v ${BASEDIR:-/volume1/docker}/znc/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/znc:latest
