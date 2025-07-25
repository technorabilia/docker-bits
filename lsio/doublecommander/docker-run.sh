# [Double Commander](https://doublecmd.sourceforge.io/) is a free cross platform
# open source file manager with two panels side by side. It is inspired by Total
# Commander and features some new ideas.

. ./.env
docker run -d \
  --name=doublecommander \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Double Commander desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Double Commander desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/doublecommander/config:/config `# Users home directory in the container, stores program settings.` \
  -v ${BASEDIR:-/srv/lsio}/doublecommander/data:/data `# Host data directories, mount as many as needed.` \
  --restart unless-stopped \
  lscr.io/linuxserver/doublecommander:latest
