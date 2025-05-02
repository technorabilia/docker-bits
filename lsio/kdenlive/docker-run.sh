# [Kdenlive](https://kdenlive.org/) is a powerful free and open source cross-
# platform video editing program made by the KDE community. Feature rich and
# production ready.

. ./.env
docker run -d \
  --name=kdenlive \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SUBFOLDER=/ `# Specify a subfolder to use with reverse proxies, IE `/subfolder/` [OPTIONAL]` \
  -p 3000:3000 `# Kdenlive desktop gui` \
  -p 3001:3001 `# Kdenlive desktop gui HTTPS` \
  -v ${BASEDIR:-/volume1/docker}/kdenlive/config:/config `# Users home directory in the container, stores local files and settings` \
  --device /dev/dri:/dev/dri `# Add this for hardware acceleration (Linux hosts only) [OPTIONAL]` \
  --shm-size="1gb" `# [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/kdenlive:latest
