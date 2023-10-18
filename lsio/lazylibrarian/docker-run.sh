# [Lazylibrarian](https://lazylibrarian.gitlab.io/) is a program to follow
# authors and grab metadata for all your digital reading needs. It uses a
# combination of Goodreads Librarything and optionally GoogleBooks as sources
# for author info and book info. This container is based on the DobyTang fork.

. ./.env
docker run -d \
  --name=lazylibrarian \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DOCKER_MODS=linuxserver/mods:universal-calibre|linuxserver/mods:lazylibrarian-ffmpeg `# optional` `# Allows additional functionality to be added, e.g. the Calibredb import program (optional, more info below)` \
  -p 5299:5299 `# The port for the LazyLibrarian webinterface` \
  -v ${BASEDIR:-/volume1/docker}/lazylibrarian/config:/config `# LazyLibrarian config` \
  -v ${BASEDIR:-/volume1/docker}/lazylibrarian/downloads:/downloads `# Download location` \
  -v ${BASEDIR:-/volume1/docker}/lazylibrarian/books:/books `# optional` `# Books location` \
  --restart unless-stopped \
  ghcr.io/linuxserver/lazylibrarian
