# [Adguardhome-sync](https://github.com/bakito/adguardhome-sync/) is a tool to
# synchronize AdGuardHome config to replica instances.

. ./.env
docker run -d \
  --name=adguardhome-sync \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CONFIGFILE=/config/adguardhome-sync.yaml `# optional` `# Set a custom config file.` \
  -p 8080:8080 `# Port for AdGuardHome Sync's web API.` \
  -v ${BASEDIR:-/volume1/docker}/adguardhome-sync/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/adguardhome-sync:latest
