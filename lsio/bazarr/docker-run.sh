# [Bazarr](https://www.bazarr.media/) is a companion application to Sonarr and
# Radarr. It can manage and download subtitles based on your requirements. You
# define your preferences by TV show or movie and Bazarr takes care of
# everything for you.

. ./.env
docker run -d \
  --name=bazarr \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 6767:6767 `# Allows HTTP access to the internal webserver.` \
  -v ${BASEDIR:-/volume1/docker}/bazarr/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/bazarr/movies:/movies `# optional` `# Location of your movies` \
  -v ${BASEDIR:-/volume1/docker}/bazarr/tv:/tv `# optional` `# Location of your TV Shows` \
  --restart unless-stopped \
  ghcr.io/linuxserver/bazarr
