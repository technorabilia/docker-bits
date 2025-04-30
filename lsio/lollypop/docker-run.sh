# [Lollypop](https://wiki.gnome.org/Apps/Lollypop) is a lightweight modern music
# player designed to work excellently on the GNOME desktop environment.

. ./.env
docker run -d \
  --name=lollypop \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Lollypop desktop gui.` \
  -p 3001:3001 `# Lollypop desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/lollypop/config:/config `# Users home directory in the container, stores settings and downloaded metadata for music.` \
  --restart unless-stopped \
  lscr.io/linuxserver/lollypop:latest
