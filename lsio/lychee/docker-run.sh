# [Lychee](https://lycheeorg.github.io/) is a free photo-management tool, which
# runs on your server or web-space. Installing is a matter of seconds. Upload,
# manage and share photos like from a native application. Lychee comes with
# everything you need and all your photos are stored securely.' ### UPGRADE
# WARNING Please note that the v4 upgrade process resets ALL password-protected
# albums. Any albums that were made public with a password will need to be re-
# secured.

source ./.env
docker run -d \
  --name=lychee \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e DB_HOST=mariadb `# for specifying the database host` \
  -e DB_PORT=3306 `# for specifying the database port` \
  -e DB_USERNAME=lychee `# for specifying the database user` \
  -e DB_PASSWORD=dbpassword `# for specifying the database password` \
  -e DB_DATABASE=lychee `# for specifying the database to be used` \
  -p 80:80 `# http gui` \
  -v ${BASEDIR:-/volume1/docker}/lychee/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/lychee/pictures:/pictures `# Where lychee will store uploaded data.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/lychee
