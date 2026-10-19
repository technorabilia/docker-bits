# [ArtCraft](https://getartcraft.com/) is a suite of open source creative
# applications written in Rust. This image bundles PhotoCraft (image editor),
# VectorCraft (vector illustration), FilmCraft (video editor), LightCraft (photo
# library and raw developer), PdfCraft (PDF workbench), EffectCraft (motion
# graphics and VFX compositor), DesignCraft (page layout and publishing) and
# FigCraft (interface design and prototyping) in a single desktop.

. ./.env
docker run -d \
  --name=craft-apps \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP Craft Apps desktop gui, must be proxied.` \
  -p 3001:3001 `# HTTPS Craft Apps desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/craft-apps/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/craft-apps:latest
