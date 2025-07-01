# [Calibre-web](https://github.com/janeczku/calibre-web) is a web app providing
# a clean interface for browsing, reading and downloading eBooks using an
# existing Calibre database. It is also possible to integrate google drive and
# edit metadata and your calibre library through the app itself. This software
# is a fork of library and licensed under the GPL v3 License.

. ./.env
docker run -d \
  --name=calibre-web \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DOCKER_MODS=linuxserver/mods:universal-calibre `# #optional & **x86-64 only** Adds the ability to perform ebook conversion [OPTIONAL]` \
  -e OAUTHLIB_RELAX_TOKEN_SCOPE=1 `# Optionally set this to allow Google OAUTH to work [OPTIONAL]` \
  -p 8083:8083 `# WebUI` \
  -v ${BASEDIR:-/srv/lsio}/calibre-web/config:/config `# Where calibre-web stores the internal database and config.` \
  -v ${BASEDIR:-/srv/lsio}/calibre-web/books:/books `# Where your preexisting calibre database is located.` \
  --restart unless-stopped \
  lscr.io/linuxserver/calibre-web:latest
