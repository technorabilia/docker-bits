# [Doplarr](https://github.com/kiranshila/Doplarr) is an *arr request bot for
# Discord.'

. ./.env
docker run -d \
  --name=doplarr \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DISCORD__TOKEN= `# Specify your discord bot token.` \
  -e OVERSEERR__API= `# Specify your Overseerr API key. Leave blank if using Radarr/Sonarr.` \
  -e OVERSEERR__URL=http://localhost:5055 `# Specify your Overseerr URL. Leave blank if using Radarr/Sonarr.` \
  -e RADARR__API= `# Specify your Radarr API key. Leave blank if using Overseerr.` \
  -e RADARR__URL=http://localhost:7878 `# Specify your Radarr URL. Leave blank if using Overseerr.` \
  -e SONARR__API= `# Specify your Sonarr API key. Leave blank if using Overseerr.` \
  -e SONARR__URL=http://localhost:8989 `# Specify your Sonarr URL. Leave blank if using Overseerr.` \
  -e DISCORD__MAX_RESULTS=25 `# Sets the maximum size of the search results selection [OPTIONAL]` \
  -e DISCORD__REQUESTED_MSG_STYLE=:plain `# Sets the style of the request alert message. One of `:plain` `:embed` `:none` [OPTIONAL]` \
  -e SONARR__QUALITY_PROFILE= `# The name of the quality profile to use by default for Sonarr [OPTIONAL]` \
  -e RADARR__QUALITY_PROFILE= `# The name of the quality profile to use by default for Radarr [OPTIONAL]` \
  -e SONARR__ROOTFOLDER= `# The root folder to use by default for Sonarr [OPTIONAL]` \
  -e RADARR__ROOTFOLDER= `# The root folder to use by default for Radarr [OPTIONAL]` \
  -e SONARR__LANGUAGE_PROFILE= `# The name of the language profile to use by default for Sonarr [OPTIONAL]` \
  -e OVERSEERR__DEFAULT_ID= `# The Overseerr user id to use by default if there is no associated discord account for the requester [OPTIONAL]` \
  -e PARTIAL_SEASONS=true `# Sets whether users can request partial seasons. [OPTIONAL]` \
  -e LOG_LEVEL=:info `# The log level for the logging backend. This can be changed for debugging purposes. One of trace `:debug` `:info` `:warn` `:error` `:fatal` `:report` [OPTIONAL]` \
  -e JAVA_OPTS= `# For passing additional java options. [OPTIONAL]` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/srv/lsio}/doplarr/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/doplarr:latest
