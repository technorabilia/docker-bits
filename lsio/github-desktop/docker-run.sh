# [Github Desktop](https://desktop.github.com/) is an open source Electron-based
# GitHub app. It is written in TypeScript and uses React.

. ./.env
docker run -d \
  --name=github-desktop \
  --cap-add=IPC_LOCK \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Github Desktop gui.` \
  -p 3001:3001 `# HTTPS Github Desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/github-desktop/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/github-desktop:latest
