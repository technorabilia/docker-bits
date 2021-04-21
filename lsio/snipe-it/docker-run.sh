# [Snipe-it](https://github.com/snipe/snipe-it) makes asset management easy. It
# was built by people solving real-world IT and asset management problems, and a
# solid UX has always been a top priority. Straightforward design and bulk
# actions mean getting things done faster.

source ./.env
docker run -d \
  --name=snipe-it \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e APP_URL=<hostname or ip> `# Hostname or IP and port if applicable IE <ip or hostname>:8080` \
  -e MYSQL_PORT_3306_TCP_ADDR=<mysql host> `# Mysql hostname or IP to use` \
  -e MYSQL_PORT_3306_TCP_PORT=<mysql port> `# Mysql port to use` \
  -e MYSQL_DATABASE=<mysql database> `# Mysql database to use` \
  -e MYSQL_USER=<mysql pass> `# Mysql user to use` \
  -e MYSQL_PASSWORD=changeme `# Mysql password to use` \
  -p 8080:80 `# Snipe-IT Web UI` \
  -v ${BASEDIR:-/volume1/docker}/snipe-it/config:/config `# Contains your config files and data storage for Snipe-IT` \
  --restart unless-stopped \
  ghcr.io/linuxserver/snipe-it
