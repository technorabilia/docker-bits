# [digiKam](https://www.digikam.org/): Professional Photo Management with the
# Power of Open Source

source ./.env
docker run -d \
  --name=digikam \
  --net=host `# Use Host Networking` \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder to use with reverse proxies, IE `/subfolder/`` \
  -e KEYBOARD=en-us-qwerty `# optional` `# See the keyboard layouts section for more information and options.` \
  -p 3000:3000 `# optional` `# digiKam desktop gui` \
  -v ${BASEDIR:-/volume1/docker}/digikam/config:/config `# Users home directory in the container, stores database.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/digikam
