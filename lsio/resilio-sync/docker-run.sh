# [Resilio-sync](https://www.resilio.com/individuals/) (formerly BitTorrent
# Sync) uses the BitTorrent protocol to sync files and folders between all of
# your devices. There are both free and paid versions, this container supports
# both. There is an official sync image but we created this one as it supports
# user mapping to simplify permissions for volumes.

. ./.env
docker run -d \
  --name=resilio-sync \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8888:8888 `# WebUI` \
  -p 55555:55555 `# Sync Port.` \
  -v ${BASEDIR:-/volume1/docker}/resilio-sync/config:/config `# Where resilio-sync should store its config file.` \
  -v ${BASEDIR:-/volume1/docker}/resilio-sync/downloads:/downloads `# Folder for downloads/cache.` \
  -v ${BASEDIR:-/volume1/docker}/resilio-sync/sync:/sync `# Sync folders root.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/resilio-sync
