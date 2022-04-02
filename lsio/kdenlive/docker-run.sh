# [Kdenlive](https://kdenlive.org/) is a powerful free and open source cross-
# platform video editing program made by the KDE community. Feature rich and
# production ready.

source ./.env
docker run -d \
  --name=kdenlive \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder to use with reverse proxies, IE `/subfolder/`` \
  -e KEYBOARD=en-us-qwerty `# optional` `# See the keyboard layouts section for more information and options.` \
  -p 3000:3000 `# Kdenlive desktop gui` \
  -v ${BASEDIR:-/volume1/docker}/kdenlive/config:/config `# Users home directory in the container, stores local files and settings` \
  --device /dev/dri:/dev/dri `# optional` `# Add this for hardware acceleration (Linux hosts only)` \
  --shm-size="1gb" `# optional` \
  --restart unless-stopped \
  ghcr.io/linuxserver/kdenlive
