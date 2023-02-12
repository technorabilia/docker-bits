# [Freshrss](https://freshrss.org/) is a free, self-hostable aggregator for rss
# feeds.

source ./.env
docker run -d \
  --name=freshrss \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/freshrss/config:/config `# Local storage for freshrss site files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/freshrss
