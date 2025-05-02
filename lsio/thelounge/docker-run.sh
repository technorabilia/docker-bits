# [Thelounge](https://thelounge.github.io/) (a fork of shoutIRC) is a web IRC
# client that you host on your own server.

. ./.env
docker run -d \
  --name=thelounge \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 9000:9000 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/thelounge/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/thelounge:latest
