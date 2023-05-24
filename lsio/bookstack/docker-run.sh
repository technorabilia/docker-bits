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
  -e APP_URL=<yourbaseurl> `# for specifying the IP:port or URL your application will be accessed on (ie. `http://192.168.1.1:6875` or `https://bookstack.mydomain.com`` \
  -e DB_HOST=<yourdbhost> `# for specifying the database host` \
  -e DB_PORT=<yourdbport> `# for specifying the database port if not default 3306` \
  -e DB_USER=<yourdbuser> `# for specifying the database user` \
  -e DB_PASS=<yourdbpass> `# for specifying the database password (non-alphanumeric passwords must be properly escaped.)` \
  -e DB_DATABASE=bookstackapp `# for specifying the database to be used` \
  -p 6875:80 `# will map the container's port 80 to port 6875 on the host` \
  -v ${BASEDIR:-/volume1/docker}/bookstack/config:/config `# this will store any uploaded data on the docker host` \
  --restart unless-stopped \
  ghcr.io/linuxserver/bookstack
