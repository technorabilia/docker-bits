# [Remmina](https://remmina.org/) is a remote desktop client written in GTK,
# aiming to be useful for system administrators and travellers, who need to work
# with lots of remote computers in front of either large or tiny screens.
# Remmina supports multiple network protocols, in an integrated and consistent
# user interface. Currently RDP, VNC, SPICE, SSH and EXEC are supported.

. ./.env
docker run -d \
  --name=remmina \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Remmina desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Remmina desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/remmina/config:/config `# Users home directory in the container, stores program settings.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/remmina:latest
