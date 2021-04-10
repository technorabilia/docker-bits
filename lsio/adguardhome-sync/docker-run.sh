# Adguardhome-sync is a tool to synchronize AdGuardHome config to replica
# instances.

source ./.env
docker run -d \
  --name=adguardhome-sync \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CONFIGFILE=/config/adguardhome-sync.yaml `# optional` `# Set a custom config file.` \
  -p 8080:8080 `# Port for AdGuardHome Sync's web API.` \
  -v ${BASEDIR:-/volume1/docker}/adguardhome-sync/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/adguardhome-sync
