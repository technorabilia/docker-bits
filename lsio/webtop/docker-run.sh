# [Webtop](https://github.com/linuxserver/docker-webtop) - Alpine and Ubuntu
# based containers containing full desktop environments in officially supported
# flavors accessible via any modern web browser.

source ./.env
docker run -d \
  --name=webtop \
  --privileged `# optional` \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder to use with reverse proxies, IE `/subfolder/`` \
  -p 3000:3000 `# Web Desktop GUI` \
  -v ${BASEDIR:-/volume1/docker}/webtop/config:/config `# abc users home directory` \
  -v /var/run/docker.sock:/var/run/docker.sock `# optional` `# Docker Socket on the system, if you want to use Docker in the container` \
  --shm-size="1gb" `# optional` \
  --restart unless-stopped \
  ghcr.io/linuxserver/webtop
