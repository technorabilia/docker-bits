# [GitQlient](https://github.com/francescmm/GitQlient) is a multi-platform Git
# client originally forked from QGit. Nowadays it goes beyond of just a fork and
# adds a lot of new functionality.

. ./.env
docker run -d \
  --name=gitqlient \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# GitQlient desktop gui.` \
  -p 3001:3001 `# HTTPS GitQlient desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/gitqlient/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  ghcr.io/linuxserver/gitqlient
