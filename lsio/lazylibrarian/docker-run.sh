# [Lazylibrarian](https://lazylibrarian.gitlab.io/) is a program to follow
# authors and grab metadata for all your digital reading needs. It uses a
# combination of Goodreads Librarything and optionally GoogleBooks as sources
# for author info and book info. This container is based on the DobyTang fork.

. ./.env
docker run -d \
  --name=lazylibrarian \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DOCKER_MODS=linuxserver/mods:universal-calibre|linuxserver/mods:lazylibrarian-ffmpeg `# Allows additional functionality to be added, e.g. the Calibredb import program (optional, more info below) [OPTIONAL]` \
  -p 5299:5299 `# The port for the LazyLibrarian webinterface` \
  -v ${BASEDIR:-/srv/lsio}/lazylibrarian/config:/config `# LazyLibrarian config` \
  -v ${BASEDIR:-/srv/lsio}/lazylibrarian/downloads:/downloads `# Download location` \
  -v ${BASEDIR:-/srv/lsio}/lazylibrarian/books:/books `# Books location [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/lazylibrarian:latest
