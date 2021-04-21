# [Pydio](https://pydio.com/) (formerly AjaXplorer) is a mature open source
# software solution for file sharing and synchronization. With intuitive user
# interfaces (web / mobile / desktop), Pydio provides enterprise-grade features
# to gain back control and privacy of your data: user directory connectors,
# legacy filesystems drivers, comprehensive admin interface, and much more.

source ./.env
docker run -d \
  --name=pydio \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 443:443 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/pydio/config:/config `# Where pydio should store it's configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/pydio/data:/data `# Where pydio should store uploaded files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/pydio
