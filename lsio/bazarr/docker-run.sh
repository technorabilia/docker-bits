# [Bazarr](https://www.bazarr.media/) is a companion application to Sonarr and
# Radarr. It can manage and download subtitles based on your requirements. You
# define your preferences by TV show or movie and Bazarr takes care of
# everything for you.

. ./.env
docker run -d \
  --name=bazarr \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 6767:6767 `# Allows HTTP access to the internal webserver.` \
  -v ${BASEDIR:-/volume1/docker}/bazarr/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/bazarr/movies:/movies `# Location of your movies [OPTIONAL]` \
  -v ${BASEDIR:-/volume1/docker}/bazarr/tv:/tv `# Location of your TV Shows [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/bazarr:latest
