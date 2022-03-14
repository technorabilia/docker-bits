# [Blender](https://www.blender.org/) is a free and open-source 3D computer
# graphics software toolset used for creating animated films, visual effects,
# art, 3D printed models, motion graphics, interactive 3D applications, virtual
# reality, and computer games. **This image does not support GPU rendering out
# of the box only accelerated workspace experience**

source ./.env
docker run -d \
  --name=blender \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder to use with reverse proxies, IE `/subfolder/`` \
  -e KEYBOARD=en-us-qwerty `# optional` `# See the keyboard layouts section for more information and options.` \
  -p 3000:3000 `# Blender desktop gui` \
  -v ${BASEDIR:-/volume1/docker}/blender/config:/config `# Users home directory in the container, stores local files and settings` \
  --device /dev/dri:/dev/dri `# optional` `# Add this for hardware acceleration (Linux hosts only)` \
  --restart unless-stopped \
  ghcr.io/linuxserver/blender
