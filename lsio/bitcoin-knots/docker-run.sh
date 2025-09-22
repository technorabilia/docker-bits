# [Bitcoin Knots](https://bitcoinknots.org/) can be used as a desktop client for
# regular payments or as a full node server utility for merchants and other
# payment services.

. ./.env
docker run -d \
  --name=bitcoin-knots \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Bitcoin Knots desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Bitcoin Knots desktop gui HTTPS.` \
  -p 8333:8333 `# Bitcoin Knots node port.` \
  -v ${BASEDIR:-/srv/lsio}/bitcoin-knots/config:/config `# Users home directory in the container, stores all data.` \
  --restart unless-stopped \
  lscr.io/linuxserver/bitcoin-knots:latest
