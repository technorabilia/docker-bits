# [Orca Slicer](https://github.com/SoftFever/OrcaSlicer) is an open source
# slicer for FDM printers. OrcaSlicer is fork of Bambu Studio, it was previously
# known as BambuStudio-SoftFever, Bambu Studio is forked from PrusaSlicer by
# Prusa Research, which is from Slic3r by Alessandro Ranellucci and the RepRap
# community

. ./.env
docker run -d \
  --name=orcaslicer \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Orca Slicer desktop gui.` \
  -p 3001:3001 `# Orca Slicer desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/orcaslicer/config:/config `# Users home directory in the container, stores program settings and files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/orcaslicer:latest
