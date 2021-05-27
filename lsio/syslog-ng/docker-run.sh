# [syslog-ng](https://www.syslog-ng.com/products/open-source-log-management/)
# allows you to flexibly collect, parse, classify, rewrite and correlate logs
# from across your infrastructure and store or route them to log analysis tools.

source ./.env
docker run -d \
  --name=syslog-ng \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 514:5514 `# Syslog UDP` \
  -p 601:6601 `# Syslog TCP` \
  -p 6514:6514 `# Syslog TLS` \
  -v ${BASEDIR:-/volume1/docker}/syslog-ng/config:/config `# Stores config and application files` \
  -v ${BASEDIR:-/volume1/docker}/syslog-ng/var/log:/var/log `# optional` `# Stores logs collected by the syslog-ng service` \
  --restart unless-stopped \
  ghcr.io/linuxserver/syslog-ng
