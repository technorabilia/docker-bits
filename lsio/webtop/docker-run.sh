# [Webtop](https://github.com/linuxserver/gclient) - Alpine, Ubuntu, Fedora, and
# Arch based containers containing full desktop environments in officially
# supported flavors accessible via any modern web browser.

source ./.env
docker run -d \
  --name=webtop \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder to use with reverse proxies, IE `/subfolder/`` \
  -e KEYBOARD=en-us-qwerty `# optional` `# See the keyboard layouts section for more information and options.` \
  -e TITLE=Webtop `# optional` `# String which will be used as page/tab title in the web browser.` \
  -p 3000:3000 `# Web Desktop GUI` \
  -v ${BASEDIR:-/volume1/docker}/webtop/config:/config `# abc users home directory` \
  -v /var/run/docker.sock:/var/run/docker.sock `# optional` `# Docker Socket on the system, if you want to use Docker in the container` \
  --device /dev/dri:/dev/dri `# optional` `# Add this for GL support (Linux hosts only)` \
  --shm-size="1gb" `# optional` \
  --restart unless-stopped \
  ghcr.io/linuxserver/webtop
