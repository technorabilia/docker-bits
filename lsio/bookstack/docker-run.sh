# [Bookstack](https://github.com/BookStackApp/BookStack) is a free and open
# source Wiki designed for creating beautiful documentation. Featuring a simple,
# but powerful WYSIWYG editor it allows for teams to create detailed and useful
# documentation with ease. Powered by SQL and including a Markdown editor for
# those who prefer it, BookStack is geared towards making documentation more of
# a pleasure than a chore. For more information on BookStack visit their website
# and check it out: https://www.bookstackapp.com

. ./.env
docker run -d \
  --name=bookstack \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e APP_URL= `# The protocol, IP/URL, and port that your application will be accessed on (ie. `http://192.168.1.1:6875` or `https://bookstack.mydomain.com`` \
  -e APP_KEY= `# Session encryption key. You will need to generate this with `docker run -it --rm --entrypoint /bin/bash lscr.io/linuxserver/bookstack:latest appkey`` \
  -e DB_HOST= `# The database instance hostname` \
  -e DB_PORT=3306 `# Database port` \
  -e DB_USERNAME= `# Database user` \
  -e DB_PASSWORD= `# Database password (minimum 4 characters & non-alphanumeric passwords must be properly escaped.)` \
  -e DB_DATABASE= `# Database name` \
  -e QUEUE_CONNECTION= `# optional` `# Set to `database` to enable async actions like sending email or triggering webhooks. See [documentation](https://www.bookstackapp.com/docs/admin/email-webhooks/#async-action-handling).` \
  -p 6875:80 `# http/s web interface.` \
  -v ${BASEDIR:-/volume1/docker}/bookstack/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/bookstack
