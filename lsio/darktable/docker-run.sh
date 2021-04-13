# [darktable]({{ project_url }}) is an open source photography workflow
# application and raw developer. A virtual lighttable and darkroom for
# photographers. It manages your digital negatives in a database, lets you view
# them through a zoomable lighttable and enables you to develop raw images and
# enhance them.

source ./.env
docker run -d \
  --name=darktable \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# Darktable desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/darktable/config:/config `# Users home directory in the container, stores program settings and images` \
  --restart unless-stopped \
  ghcr.io/linuxserver/darktable
