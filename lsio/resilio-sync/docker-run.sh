# [Resilio-sync](https://www.resilio.com/individuals/) (formerly BitTorrent
# Sync) uses the BitTorrent protocol to sync files and folders between all of
# your devices. There are both free and paid versions, this container supports
# both. There is an official sync image but we created this one as it supports
# user mapping to simplify permissions for volumes.

. ./.env
docker run -d \
  --name=resilio-sync \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8888:8888 `# WebUI` \
  -p 55555:55555 `# Sync Port.` \
  -v ${BASEDIR:-/srv/lsio}/resilio-sync/config:/config `# Where resilio-sync should store its config file.` \
  -v ${BASEDIR:-/srv/lsio}/resilio-sync/downloads:/downloads `# Folder for downloads/cache.` \
  -v ${BASEDIR:-/srv/lsio}/resilio-sync/sync:/sync `# Sync folders root.` \
  --restart unless-stopped \
  lscr.io/linuxserver/resilio-sync:latest
