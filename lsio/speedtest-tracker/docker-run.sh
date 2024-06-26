# [Speedtest-tracker](https://github.com/alexjustesen/speedtest-tracker) is a
# self-hosted internet performance tracking application that runs speedtest
# checks against Ookla's Speedtest service.

. ./.env
docker run -d \
  --name=speedtest-tracker \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e APP_KEY= `# App key used for encrypting stored data. You can generate a key at [https://speedtest-tracker.dev](https://speedtest-tracker.dev)` \
  -e DB_CONNECTION=sqlite `# Set the database type to use. `sqlite`, `pgsql`, or `mysql`` \
  -e SPEEDTEST_SCHEDULE= `# Set the test schedule in cron format. e.g. `0 */6 * * *`` \
  -e SPEEDTEST_SERVERS= `# A comma-separated list of server IDs to test against. Run `docker exec speedtest-tracker php /app/www/artisan app:ookla-list-servers` to get a list of nearby servers.` \
  -e DB_HOST= `# optional` `# Database hostname (postgres/mysql).` \
  -e DB_PORT= `# optional` `# Database port (postgres/mysql).` \
  -e DB_DATABASE= `# optional` `# Database name (postgres/mysql).` \
  -e DB_USERNAME= `# optional` `# Database username (postgres/mysql).` \
  -e DB_PASSWORD= `# optional` `# Database password (postgres/mysql).` \
  -e DISPLAY_TIMEZONE=Etc/UTC `# optional` `# Timezone for the UI.` \
  -e PRUNE_RESULTS_OLDER_THAN=0 `# optional` `# Days to keep test results.` \
  -p 80:80 `# Web UI` \
  -v ${BASEDIR:-/volume1/docker}/speedtest-tracker/config:/config `# Contains speedtest-tracker config and database, if using sqlite.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/speedtest-tracker
