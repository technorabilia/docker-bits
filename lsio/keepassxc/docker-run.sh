# [KeePassXC](https://keepassxc.org/) is a free and open-source password
# manager. It started as a community fork of KeePassX (itself a cross-platform
# port of KeePass).

. ./.env
docker run -d \
  --name=keepassxc \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# KeePassXC desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# KeePassXC desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/keepassxc/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/keepassxc:latest
