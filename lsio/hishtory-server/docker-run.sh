# [hiSHtory](https://github.com/ddworken/hishtory) is a better shell history. It
# stores your shell history in context (what directory you ran the command in,
# whether it succeeded or failed, how long it took, etc). This is all stored
# locally and end-to-end encrypted for syncing to to all your other computers.

. ./.env
docker run -d \
  --name=hishtory-server \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e HISHTORY_POSTGRES_DB=postgresql://${HISHTORY_DB_USER}:${HISHTORY_DB_PASS}@hishtory-db:5432/hishtory?sslmode=disable `# optional` `# Postgres DB [Connection URI](https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING). Special characters must be [URL encoded](https://en.wikipedia.org/wiki/URL_encoding).` \
  -e HISHTORY_SQLITE_DB=/config/hishtory.db `# optional` `# SQLite database path. Needs to be a mounted volume for persistence. Don't set at the same time as HISHTORY_POSTGRES_DB.` \
  -p 8080:8080 `# API port` \
  -v ${BASEDIR:-/volume1/docker}/hishtory-server/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/hishtory-server
