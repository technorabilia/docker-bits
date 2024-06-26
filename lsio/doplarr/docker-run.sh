# [Doplarr](https://github.com/kiranshila/Doplarr) is an *arr request bot for
# Discord.'

. ./.env
docker run -d \
  --name=doplarr \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DISCORD__TOKEN= `# Specify your discord bot token.` \
  -e OVERSEERR__API= `# Specify your Overseerr API key. Leave blank if using Radarr/Sonarr.` \
  -e OVERSEERR__URL=http://localhost:5055 `# Specify your Overseerr URL. Leave blank if using Radarr/Sonarr.` \
  -e RADARR__API= `# Specify your Radarr API key. Leave blank if using Overseerr.` \
  -e RADARR__URL=http://localhost:7878 `# Specify your Radarr URL. Leave blank if using Overseerr.` \
  -e SONARR__API= `# Specify your Sonarr API key. Leave blank if using Overseerr.` \
  -e SONARR__URL=http://localhost:8989 `# Specify your Sonarr URL. Leave blank if using Overseerr.` \
  -e DISCORD__MAX_RESULTS=25 `# optional` `# Sets the maximum size of the search results selection` \
  -e DISCORD__REQUESTED_MSG_STYLE=:plain `# optional` `# Sets the style of the request alert message. One of `:plain` `:embed` `:none`` \
  -e SONARR__QUALITY_PROFILE= `# optional` `# The name of the quality profile to use by default for Sonarr` \
  -e RADARR__QUALITY_PROFILE= `# optional` `# The name of the quality profile to use by default for Radarr` \
  -e SONARR__ROOTFOLDER= `# optional` `# The root folder to use by default for Sonarr` \
  -e RADARR__ROOTFOLDER= `# optional` `# The root folder to use by default for Radarr` \
  -e SONARR__LANGUAGE_PROFILE= `# optional` `# The name of the language profile to use by default for Sonarr` \
  -e OVERSEERR__DEFAULT_ID= `# optional` `# The Overseerr user id to use by default if there is no associated discord account for the requester` \
  -e PARTIAL_SEASONS=true `# optional` `# Sets whether users can request partial seasons.` \
  -e LOG_LEVEL=:info `# optional` `# The log level for the logging backend. This can be changed for debugging purposes. One of trace `:debug` `:info` `:warn` `:error` `:fatal` `:report`` \
  -e JAVA_OPTS= `# optional` `# For passing additional java options.` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/doplarr/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/doplarr
