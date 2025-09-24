# [darktable](https://www.darktable.org/) is an open source photography workflow
# application and raw developer. A virtual lighttable and darkroom for
# photographers. It manages your digital negatives in a database, lets you view
# them through a zoomable lighttable and enables you to develop raw images and
# enhance them.

. ./.env
docker run -d \
  --name=darktable \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Darktable desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Darktable desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/darktable/config:/config `# Users home directory in the container, stores program settings and images` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/darktable:latest
