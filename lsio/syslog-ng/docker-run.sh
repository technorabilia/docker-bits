# [syslog-ng](https://www.syslog-ng.com/products/open-source-log-management/)
# allows you to flexibly collect, parse, classify, rewrite and correlate logs
# from across your infrastructure and store or route them to log analysis tools.

. ./.env
docker run -d \
  --name=syslog-ng \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e LOG_TO_STDOUT= `# If set to `true` container will log to stdout, otherwise will log to `/config/log/`. [OPTIONAL]` \
  -p 514:5514/udp `# Syslog UDP` \
  -p 601:6601/tcp `# Syslog TCP` \
  -p 6514:6514/tcp `# Syslog TLS` \
  -v ${BASEDIR:-/volume1/docker}/syslog-ng/config:/config `# Stores config and application files` \
  -v /var/log:/var/log `# Stores logs collected by the syslog-ng service [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/syslog-ng:latest
