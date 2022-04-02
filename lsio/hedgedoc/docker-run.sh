# [HedgeDoc](https://hedgedoc.org/) gives you access to all your files wherever
# you are. HedgeDoc is a real-time, multi-platform collaborative markdown note
# editor. This means that you can write notes with other people on your desktop,
# tablet or even on the phone. You can sign-in via multiple auth providers like
# Facebook, Twitter, GitHub and many more on the homepage.

source ./.env
docker run -d \
  --name=hedgedoc \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e DB_HOST=<hostname or ip> `# Host address of mysql database` \
  -e DB_PORT=3306 `# Port to access mysql database default is 3306` \
  -e DB_USER=hedgedoc `# Database user` \
  -e DB_PASS=<secret password> `# Database password` \
  -e DB_NAME=hedgedoc `# Database name` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CMD_DOMAIN=localhost `# The address the gui will be accessed at (ie. `192.168.1.1` or `hedgedoc.domain.com`).` \
  -e CMD_URL_ADDPORT=true `# optional` `# Set to `false` if accessing at port `80` or `443`.` \
  -e CMD_PROTOCOL_USESSL=false `# optional` `# Set to `true` if accessing over https via reverse proxy.` \
  -e CMD_PORT=3000 `# optional` `# If you wish to access hedgedoc at a port different than 80, 443 or 3000, you need to set this to that port (ie. `CMD_PORT=5000`) and change the port mapping accordingly (5000:5000).` \
  -p 3000:3000 `# Web gui port (internal port also needs to be changed if accessing at port other than 80, 443 and 3000).` \
  -v ${BASEDIR:-/volume1/docker}/hedgedoc/config:/config `# HedgeDoc config and configurable files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/hedgedoc
