# [Kometa](https://github.com/Kometa-Team/Kometa) is a powerful tool designed to
# give you complete control over your media libraries. With Kometa, you can take
# your customization to the next level, with granular control over metadata,
# collections, overlays, and much more.

. ./.env
docker run -d \
  --name=kometa \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e KOMETA_CONFIG=/config/config.yml `# Specify a custom config file to use. [OPTIONAL]` \
  -e KOMETA_TIME=03:00 `# Comma-separated list of times to update each day. Format: `HH:MM`. [OPTIONAL]` \
  -e KOMETA_RUN=False `# Set to `True` to run without the scheduler. [OPTIONAL]` \
  -e KOMETA_TEST=False `# Set to `True` to run in debug mode with only collections that have `test: true`. [OPTIONAL]` \
  -e KOMETA_NO_MISSING=False `# Set to `True` to run without any of the missing movie/show functions. [OPTIONAL]` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/srv/lsio}/kometa/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/kometa:latest
