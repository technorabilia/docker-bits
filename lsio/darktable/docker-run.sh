# [darktable](https://www.darktable.org/) is an open source photography workflow
# application and raw developer. A virtual lighttable and darkroom for
# photographers. It manages your digital negatives in a database, lets you view
# them through a zoomable lighttable and enables you to develop raw images and
# enhance them.

. ./.env
docker run -d \
  --name=darktable \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Darktable desktop gui.` \
  -p 3001:3001 `# Darktable desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/darktable/config:/config `# Users home directory in the container, stores program settings and images` \
  --restart unless-stopped \
  ghcr.io/linuxserver/darktable
