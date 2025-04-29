# [Xbackbone](https://github.com/SergiX44/XBackBone) is a simple, self-hosted,
# lightweight PHP file manager that support the instant sharing tool ShareX and
# *NIX systems. It supports uploading and displaying images, GIF, video, code,
# formatted text, and file downloading and uploading. Also have a web UI with
# multi user management, past uploads history and search support.

. ./.env
docker run -d \
  --name=xbackbone \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/xbackbone/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/xbackbone:latest
