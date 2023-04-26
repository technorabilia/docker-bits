# [Snipe-it](https://github.com/snipe/snipe-it) makes asset management easy. It
# was built by people solving real-world IT and asset management problems, and a
# solid UX has always been a top priority. Straightforward design and bulk
# actions mean getting things done faster.

. ./.env
docker run -d \
  --name=snipe-it \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e APP_URL=http://localhost:8080 `# Hostname or IP and port if applicable, be sure to define https/http` \
  -e MYSQL_PORT_3306_TCP_ADDR= `# Mysql hostname or IP to use` \
  -e MYSQL_PORT_3306_TCP_PORT= `# Mysql port to use` \
  -e MYSQL_DATABASE= `# Mysql database to use` \
  -e MYSQL_USER= `# Mysql user to use` \
  -e MYSQL_PASSWORD= `# Mysql password to use` \
  -p 8080:80 `# Snipe-IT Web UI` \
  -v ${BASEDIR:-/volume1/docker}/snipe-it/config:/config `# Contains your config files and data storage for Snipe-IT` \
  --restart unless-stopped \
  ghcr.io/linuxserver/snipe-it
