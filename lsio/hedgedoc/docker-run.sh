# [HedgeDoc](https://hedgedoc.org/) gives you access to all your files wherever
# you are. HedgeDoc is a real-time, multi-platform collaborative markdown note
# editor. This means that you can write notes with other people on your desktop,
# tablet or even on the phone. You can sign-in via multiple auth providers like
# Facebook, Twitter, GitHub and many more on the homepage.

source ./.env
docker run -d \
  --name=hedgedoc \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e DB_HOST=<hostname or ip> `# Host address of mysql database` \
  -e DB_PORT=3306 `# Port to access mysql database default is 3306` \
  -e DB_USER=hedgedoc `# Database user` \
  -e DB_PASS=<secret password> `# Database password` \
  -e DB_NAME=hedgedoc `# Database name` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CMD_DOMAIN=localhost `# The address the gui will be accessed at (ie. `192.168.1.1` or `hedgedoc.domain.com`).` \
  -e CMD_URL_ADDPORT=true `# optional` `# Set to `false` if accessing at port `80` or `443`.` \
  -p 3000:3000 `# If you wish to access this container from http://{IP}:${PORT}` this *must* be left unchanged.` \
  -v ${BASEDIR:-/volume1/docker}/hedgedoc/config:/config `# HedgeDoc config and configurable files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/hedgedoc
