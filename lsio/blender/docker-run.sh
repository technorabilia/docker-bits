# [Blender](https://www.blender.org/) is a free and open-source 3D computer
# graphics software toolset used for creating animated films, visual effects,
# art, 3D printed models, motion graphics, interactive 3D applications, virtual
# reality, and computer games. **This image does not support GPU rendering out
# of the box only accelerated workspace experience**

. ./.env
docker run -d \
  --name=blender \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SUBFOLDER=/ `# Specify a subfolder to use with reverse proxies, IE `/subfolder/` [OPTIONAL]` \
  -p 3000:3000 `# Blender desktop gui` \
  -p 3001:3001 `# Blender desktop gui HTTPS` \
  -v ${BASEDIR:-/volume1/docker}/blender/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  lscr.io/linuxserver/blender:latest
