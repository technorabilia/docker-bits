# [Kimai](https://kimai.org/) is a professional grade time-tracking application,
# free and open-source. It handles use-cases of freelancers as well as companies
# with dozens or hundreds of users. Kimai was build to track your project times
# and ships with many advanced features, including but not limited to: JSON API,
# invoicing, data exports, multi-timer and punch-in punch-out mode, tagging,
# multi-user - multi-timezones - multi-language ([over 30 translations
# existing](https://hosted.weblate.org/projects/kimai/)!), authentication via
# SAML/LDAP/Database, two-factor authentication (2FA) with TOTP, customizable
# role and team permissions, responsive design, user/customer/project specific
# rates, advanced search & filtering, money and time budgets, advanced
# reporting, support for [plugins](https://www.kimai.org/store/) and so much
# more.

. ./.env
docker run -d \
  --name=kimai \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DATABASE_URL=mysql://your_db_user:your_db_pass@your_db_host:3306/your_db_name?charset=your_db_charset&serverVersion=your_db_version `# Configure your database connection, see Application Setup instructions.` \
  -e TRUSTED_PROXIES=127.0.0.1/32 `# If behind a reverse proxy set this to its IP or network CIDR so that Kimai trusts its headers. [OPTIONAL]` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/srv/lsio}/kimai/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/kimai:latest
