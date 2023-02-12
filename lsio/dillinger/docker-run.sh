# [Dillinger](https://github.com/joemccann/dillinger) is a cloud-enabled,
# mobile-ready, offline-storage, AngularJS powered HTML5 Markdown editor.

source ./.env
docker run -d \
  --name=dillinger \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8080:8080 `# The port for the Dillinger web interface` \
  -v ${BASEDIR:-/volume1/docker}/dillinger/config:/config `# Dillinger plugin config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/dillinger
