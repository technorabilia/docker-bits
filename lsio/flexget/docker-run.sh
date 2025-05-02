# [Flexget](http://flexget.com/) is a multipurpose automation tool for all of
# your media.

. ./.env
docker run -d \
  --name=flexget \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e FG_LOG_LEVEL=info `# Set the FlexGet logging level.` \
  -e FG_LOG_FILE=/config/flexget.log `# Set the FlexGet log file location.` \
  -e FG_CONFIG_FILE=/config/.flexget/config.yml `# Set the FlexGet config file location.` \
  -e FG_WEBUI_PASSWORD=info `# Set the FlexGet webui password. Pay attention to Bash/YAML reserved characters. [OPTIONAL]` \
  -p 5050:5050 `# HTTP port for the WebUI.` \
  -v ${BASEDIR:-/volume1/docker}/flexget/config:/config `# Local path for FlexGet config files.` \
  -v ${BASEDIR:-/volume1/docker}/flexget/data:/data `# Default path for downloads. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/flexget:latest
