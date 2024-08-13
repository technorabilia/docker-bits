# [Snapdrop](https://github.com/snapdrop/snapdrop) A local file sharing in your
# browser. Inspired by Apple's Airdrop.

. ./.env
docker run -d \
  --name=snapdrop \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/snapdrop/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/snapdrop
