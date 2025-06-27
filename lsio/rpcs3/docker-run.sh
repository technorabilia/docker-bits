# [RPCS3](https://rpcs3.net/) is a multi-platform open-source Sony PlayStation 3
# emulator and debugger written in C++ for Windows, Linux, macOS and FreeBSD.

. ./.env
docker run -d \
  --name=rpcs3 \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP RPCS3 desktop gui must be proxied.` \
  -p 3001:3001 `# HTTPS RPCS3 desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/rpcs3/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/rpcs3:latest
