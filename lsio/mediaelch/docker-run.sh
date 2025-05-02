# [MediaElch](https://github.com/Komet/MediaElch) is a MediaManager for Kodi.
# Information about Movies, TV Shows, Concerts and Music are stored as nfo
# files. Fanarts are downloaded automatically from fanart.tv. Using the nfo
# generator, MediaElch can be used with other MediaCenters as well.

. ./.env
docker run -d \
  --name=mediaelch \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# MediaElch desktop gui.` \
  -p 3001:3001 `# MediaElch desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/mediaelch/config:/config `# Users home directory in the container, stores program settings and files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/mediaelch:latest
