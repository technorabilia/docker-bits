# [LibreWolf](https://librewolf.net/) is a custom and independent version of
# Firefox, with the primary goals of privacy, security and user freedom.
# LibreWolf also aims to remove all the telemetry, data collection and
# annoyances, as well as disabling anti-freedom features like DRM.

. ./.env
docker run -d \
  --name=librewolf \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e LIBREWOLF_CLI=https://www.linuxserver.io/ `# Specify one or multiple LibreWolf CLI flags, this string will be passed to the application in full. [OPTIONAL]` \
  -p 3000:3000 `# LibreWolf desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# LibreWolf desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/librewolf/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/librewolf:latest
