# [Github Desktop](https://desktop.github.com/) is an open source Electron-based
# GitHub app. It is written in TypeScript and uses React.

. ./.env
docker run -d \
  --name=github-desktop \
  --cap-add=IPC_LOCK \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Github Desktop gui.` \
  -p 3001:3001 `# HTTPS Github Desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/github-desktop/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/github-desktop
