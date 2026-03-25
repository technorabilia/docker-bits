# [Webstation](https://github.com/linuxserver/docker-webstation) is a web native
# emulation focused LXQt desktop based on Ubuntu.

. ./.env
docker run -d \
  --name=webstation \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Webstation desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# Webstation desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/webstation/config:/config `# Users home directory in the container, stores all files and games.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/webstation:latest
