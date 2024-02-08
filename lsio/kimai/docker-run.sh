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
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DATABASE_URL=mysql://your_db_user:your_db_pass@your_db_host:3306/your_db_name?charset=your_db_charset&serverVersion=your_db_version `# Configure your database connection, see Application Setup instructions.` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/kimai/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/kimai
