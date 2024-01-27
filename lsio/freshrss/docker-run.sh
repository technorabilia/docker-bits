# [Freshrss](https://freshrss.org/) is a free, self-hostable aggregator for rss
# feeds.

. ./.env
docker run -d \
  --name=freshrss \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/freshrss/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/freshrss
