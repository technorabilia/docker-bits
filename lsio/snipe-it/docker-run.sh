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
  -e APP_KEY= `# App key used for encrypting stored data. Generate with `docker exec snipe-it php /app/www/artisan key:generate --show`.` \
  -e APP_URL=http://localhost:8080 `# Hostname or IP and port if applicable, be sure to define https/http` \
  -e MYSQL_PORT_3306_TCP_ADDR= `# Mysql hostname or IP to use` \
  -e MYSQL_PORT_3306_TCP_PORT= `# Mysql port to use` \
  -e MYSQL_DATABASE= `# Mysql database to use` \
  -e MYSQL_USER= `# Mysql user to use` \
  -e MYSQL_PASSWORD= `# Mysql password to use` \
  -e APP_DEBUG=false `# optional` `# Set to `true` to see debugging output in the web UI.` \
  -e APP_ENV=production `# optional` `# Default is `production` but can use `testing` or `develop`.` \
  -e APP_FORCE_TLS=false `# optional` `# Set to `true` if running behind a reverse proxy` \
  -e APP_LOCALE= `# optional` `# Default is `en-US`. Set to a language from [this list](https://snipe-it.readme.io/docs/configuration#section-setting-a-language).` \
  -e MAIL_PORT_587_TCP_ADDR= `# optional` `# SMTP mail server ip or hostname.` \
  -e MAIL_PORT_587_TCP_PORT= `# optional` `# SMTP mail server port.` \
  -e MAIL_ENV_FROM_ADDR= `# optional` `# The email address mail should be replied to and listed when sent.` \
  -e MAIL_ENV_FROM_NAME= `# optional` `# The name listed on email sent from the default account on the system.` \
  -e MAIL_ENV_ENCRYPTION= `# optional` `# Mail encryption to use e.g. `tls`.` \
  -e MAIL_ENV_USERNAME= `# optional` `# SMTP server login username.` \
  -e MAIL_ENV_PASSWORD= `# optional` `# SMTP server login password.` \
  -p 8080:80 `# Snipe-IT Web UI` \
  -v ${BASEDIR:-/volume1/docker}/snipe-it/config:/config `# Contains your config files and data storage for Snipe-IT` \
  --restart unless-stopped \
  ghcr.io/linuxserver/snipe-it
