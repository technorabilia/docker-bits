# [Embystat](https://github.com/mregni/EmbyStat) is a personal web server that
# can calculate all kinds of statistics from your (local) Emby server. Just
# install this on your server and let him calculate all kinds of fun stuff.

source ./.env
docker run -d \
  --name=embystat \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 6555:6555 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/embystat/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/embystat
