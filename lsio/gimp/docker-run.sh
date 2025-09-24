# [GIMP](https://www.gimp.org/) is a free and open-source raster graphics editor
# used for image manipulation (retouching) and image editing, free-form drawing,
# transcoding between different image file formats, and more specialized tasks.
# It is extensible by means of plugins, and scriptable.

. ./.env
docker run -d \
  --name=gimp \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# GIMP desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# GIMP desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/gimp/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/gimp:latest
