# [QDirStat](https://github.com/shundhammer/qdirstat) Qt-based directory
# statistics: KDirStat without any KDE -- from the author of the original
# KDirStat.

. ./.env
docker run -d \
  --name=qdirstat \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# QdirStat desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# QdirStat desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/qdirstat/config:/config `# Users home directory in the container, stores qdirstat settings and scans.` \
  -v ${BASEDIR:-/srv/lsio}/qdirstat/data:/data `# Data you want to analyze disk usage information of.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/qdirstat:latest
