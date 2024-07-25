# [Manyfold](https://github.com/manyfold3d/manyfold/) is an open source, self-
# hosted web application for managing a collection of 3D models, particularly
# focused on 3D printing.

. ./.env
docker run -d \
  --name=manyfold \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DATABASE_URL= `# Database connection URL. For sqlite use `sqlite3:/config/manyfold.sqlite3`. For postgres or mariadb use `<scheme>://<username>:<password>@<hostname>:<port>/<db name>` where `<scheme>` is `postgresql` or `mysql2`. Special characters in username/password must be [URL encoded](https://en.wikipedia.org/wiki/Percent-encoding).` \
  -e REDIS_URL= `# Redis/Valkey database URL in `redis://<hostname>:<port>/<db number>` format.` \
  -e SECRET_KEY_BASE= `# Browser session secret. Changing it will terminate all active browser sessions.` \
  -p 3214:3214 `# Port for web frontend` \
  -v ${BASEDIR:-/volume1/docker}/manyfold/config:/config `# Persistent storage for application configuration data.` \
  -v ${BASEDIR:-/volume1/docker}/manyfold/libraries:/libraries `# optional` `# Location of your 3D model libraries.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/manyfold
