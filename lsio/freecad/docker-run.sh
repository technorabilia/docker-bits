# [FreeCAD](https://www.freecad.org/) is a general-purpose parametric 3D
# computer-aided design (CAD) modeler and a building information modeling (BIM)
# software application with finite element method (FEM) support.

. ./.env
docker run -d \
  --name=freecad \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# FreeCAD desktop gui.` \
  -p 3001:3001 `# FreeCAD desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/freecad/config:/config `# Users home directory in the container, stores program settings and files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/freecad
