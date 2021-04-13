# Calibre-web is a web app providing a clean interface for browsing, reading and
# downloading eBooks using an existing Calibre database.   It is also possible
# to integrate google drive and edit metadata and your calibre library through
# the app itself.  This software is a fork of library and licensed under the GPL
# v3 License.

source ./.env
docker run -d \
  --name=calibre-web \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e DOCKER_MODS=linuxserver/calibre-web:calibre `# #optional & **x86-64 only** Adds the ability to perform ebook conversion` \
  -p 8083:8083 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/calibre-web/config:/config `# Where calibre-web stores the internal database and config.` \
  -v ${BASEDIR:-/volume1/docker}/calibre-web/books:/books `# Where your preexisting calibre database is locate.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/calibre-web
