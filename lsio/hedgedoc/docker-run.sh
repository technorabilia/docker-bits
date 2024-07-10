# [HedgeDoc](https://hedgedoc.org/) gives you access to all your files wherever
# you are. HedgeDoc is a real-time, multi-platform collaborative markdown note
# editor. This means that you can write notes with other people on your desktop,
# tablet or even on the phone. You can sign-in via multiple auth providers like
# Facebook, Twitter, GitHub and many more on the homepage.

. ./.env
docker run -d \
  --name=hedgedoc \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DB_HOST=<hostname or ip> `# Host address of mariadb database` \
  -e DB_PORT=3306 `# Port to access mariadb database default is 3306` \
  -e DB_USER=hedgedoc `# Database user` \
  -e DB_PASS=<secret password> `# Database password` \
  -e DB_NAME=hedgedoc `# Database name` \
  -e CMD_DOMAIN=localhost `# The address the gui will be accessed at (ie. `192.168.1.1` or `hedgedoc.domain.com`).` \
  -e CMD_URL_ADDPORT=false `# optional` `# Set to `true` if using a port other than `80` or `443`.` \
  -e CMD_PROTOCOL_USESSL=false `# optional` `# Set to `true` if accessing over https via reverse proxy.` \
  -e CMD_PORT=3000 `# optional` `# If you wish to access hedgedoc at a port different than 80, 443 or 3000, you need to set this to that port (ie. `CMD_PORT=5000`) and change the port mapping accordingly (5000:5000).` \
  -e CMD_ALLOW_ORIGIN=['localhost'] `# optional` `# Comma-separated list of allowed hostnames` \
  -e CMD_DB_DIALECT= `# optional` `# This variable allows selecting a database engine (if DB_HOST not set up). Available options are: `mariadb`, `mysql`, `postgres`, `sqlite`.` \
  -p 3000:3000 `# Web gui port (internal port also needs to be changed if accessing at port other than 80, 443 and 3000).` \
  -v ${BASEDIR:-/volume1/docker}/hedgedoc/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/hedgedoc
