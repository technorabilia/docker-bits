# [Plex-meta-manager](https://github.com/meisnate12/Plex-Meta-Manager) is a
# Python 3 script that can be continuously run using YAML configuration files to
# update on a schedule the metadata of the movies, shows, and collections in
# your libraries as well as automatically build collections based on various
# methods all detailed in the wiki.

source ./.env
docker run -d \
  --name=plex-meta-manager \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PMM_CONFIG=/config/config.yml `# optional` `# Specify a custom config file to use.` \
  -e PMM_TIME=03:00 `# optional` `# Comma-separated list of times to update each day. Format: `HH:MM`.` \
  -e PMM_RUN=False `# optional` `# Set to `True` to run without the scheduler.` \
  -e PMM_TEST=False `# optional` `# Set to `True` to run in debug mode with only collections that have `test: true`.` \
  -e PMM_NO_MISSING=False `# optional` `# Set to `True` to run without any of the missing movie/show functions.` \
  -v ${BASEDIR:-/volume1/docker}/plex-meta-manager/config:/config `# Local path for plex-meta-manager config files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/plex-meta-manager
