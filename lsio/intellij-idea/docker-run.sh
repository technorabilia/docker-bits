# [IntelliJ IDEA](https://www.jetbrains.com/idea/) helps you write code faster
# with tools that eliminate tedious tasks and let you focus on what matters –
# building great software.

. ./.env
docker run -d \
  --name=intellij-idea \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# IntelliJ IDEA desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# IntelliJ IDEA desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/intellij-idea/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/intellij-idea:latest
