# Codimd gives you access to all your files wherever you are.  CodiMD is a real-
# time, multi-platform collaborative markdown note editor.  This means that you
# can write notes with other people on your desktop, tablet or even on the
# phone.  You can sign-in via multiple auth providers like Facebook, Twitter,
# GitHub and many more on the homepage.

source ./.env
docker run -d \
  --name=codimd \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e DB_HOST=<hostname or ip> `# Host address of mysql database` \
  -e DB_PORT=3306 `# Port to access mysql database default is 3306` \
  -e DB_USER=codimd `# Database user` \
  -e DB_PASS=<secret password> `# Database password` \
  -e DB_NAME=codimd `# Database name` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# If you wish to access this container from http://{IP}:${PORT}` this *must* be left unchanged.` \
  -v ${BASEDIR:-/volume1/docker}/codimd/config:/config `# CodiMD config and configurable files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/codimd
