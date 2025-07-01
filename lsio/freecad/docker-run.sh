# [FreeCAD](https://www.freecad.org/) is a general-purpose parametric 3D
# computer-aided design (CAD) modeler and a building information modeling (BIM)
# software application with finite element method (FEM) support.

. ./.env
docker run -d \
  --name=freecad \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# FreeCAD desktop gui.` \
  -p 3001:3001 `# FreeCAD desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/freecad/config:/config `# Users home directory in the container, stores program settings and files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/freecad:latest
