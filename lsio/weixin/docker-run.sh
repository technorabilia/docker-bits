# [Weixin](https://weixin.qq.com/) (WeChat) is an instant messaging, social
# media, and mobile payment app developed by Tencent.

. ./.env
docker run -d \
  --name=weixin \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP Weixin desktop gui, must be proxied.` \
  -p 3001:3001 `# HTTPS Weixin desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/weixin/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/weixin:latest
