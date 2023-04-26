# [QDirStat](https://github.com/shundhammer/qdirstat) Qt-based directory
# statistics: KDirStat without any KDE -- from the author of the original
# KDirStat.

. ./.env
docker run -d \
  --name=qdirstat \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# QdirStat desktop gui.` \
  -p 3001:3001 `# QdirStat desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/qdirstat/config:/config `# Users home directory in the container, stores qdirstat settings and scans.` \
  -v ${BASEDIR:-/volume1/docker}/qdirstat/data:/data `# Data you want to analyze disk usage information of.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/qdirstat
