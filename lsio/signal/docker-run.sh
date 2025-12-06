# [Signal](https://signal.org/) is a messaging app with privacy at its core. It
# is free and easy to use, with strong end-to-end encryption that keeps your
# communication completely private.

. ./.env
docker run -d \
  --name=signal \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Signal desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# Signal desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/signal/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/signal:latest
