# [Speedtest-tracker](https://github.com/alexjustesen/speedtest-tracker) is a
# self-hosted internet performance tracking application that runs speedtest
# checks against Ookla's Speedtest service.

. ./.env
docker run -d \
  --name=speedtest-tracker \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e APP_KEY= `# App key used for encrypting stored data. You can generate a key at [https://speedtest-tracker.dev](https://speedtest-tracker.dev)` \
  -e APP_URL= `# The IP:port or URL your application will be accessed on (ie. `http://192.168.1.1:6875` or `https://bookstack.mydomain.com`` \
  -e DB_CONNECTION=sqlite `# Set the database type to use. `sqlite`, `pgsql`, or `mysql`` \
  -e SPEEDTEST_SCHEDULE= `# Set the test schedule in cron format. e.g. `0 */6 * * *`` \
  -e SPEEDTEST_SERVERS= `# A comma-separated list of server IDs to test against. Run `docker run -it --rm --entrypoint /bin/bash lscr.io/linuxserver/speedtest-tracker:latest list-servers` to get a list of nearby servers.` \
  -e DB_HOST= `# Database hostname (postgres/mysql). [OPTIONAL]` \
  -e DB_PORT= `# Database port (postgres/mysql). [OPTIONAL]` \
  -e DB_DATABASE= `# Database name (postgres/mysql). [OPTIONAL]` \
  -e DB_USERNAME= `# Database username (postgres/mysql). [OPTIONAL]` \
  -e DB_PASSWORD= `# Database password (postgres/mysql). [OPTIONAL]` \
  -e DISPLAY_TIMEZONE=Etc/UTC `# Timezone for the UI. [OPTIONAL]` \
  -e PRUNE_RESULTS_OLDER_THAN=0 `# Days to keep test results. [OPTIONAL]` \
  -p 80:80 `# Web UI` \
  -v ${BASEDIR:-/srv/lsio}/speedtest-tracker/config:/config `# Contains speedtest-tracker config and database, if using sqlite.` \
  --restart unless-stopped \
  lscr.io/linuxserver/speedtest-tracker:latest
