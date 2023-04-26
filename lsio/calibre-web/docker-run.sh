# [Calibre-web](https://github.com/janeczku/calibre-web) is a web app providing
# a clean interface for browsing, reading and downloading eBooks using an
# existing Calibre database. It is also possible to integrate google drive and
# edit metadata and your calibre library through the app itself. This software
# is a fork of library and licensed under the GPL v3 License.

. ./.env
docker run -d \
  --name=calibre-web \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DOCKER_MODS=linuxserver/mods:universal-calibre `# optional` `# #optional & **x86-64 only** Adds the ability to perform ebook conversion` \
  -e OAUTHLIB_RELAX_TOKEN_SCOPE=1 `# optional` `# Optionally set this to allow Google OAUTH to work` \
  -p 8083:8083 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/calibre-web/config:/config `# Where calibre-web stores the internal database and config.` \
  -v ${BASEDIR:-/volume1/docker}/calibre-web/books:/books `# Where your preexisting calibre database is located.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/calibre-web
