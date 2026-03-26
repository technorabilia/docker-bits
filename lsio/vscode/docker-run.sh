# [VS Code](https://code.visualstudio.com/) is an integrated development
# environment developed by Microsoft. This container runs the full desktop
# application, for a web native version see [Code
# Server](https://github.com/linuxserver/docker-code-server).

. ./.env
docker run -d \
  --name=vscode \
  --cap-add=IPC_LOCK \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# VS Code desktop gui.` \
  -p 3001:3001 `# HTTPS VS Code desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/vscode/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/vscode:latest
