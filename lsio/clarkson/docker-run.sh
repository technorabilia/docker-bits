# [Clarkson](https://github.com/linuxserver/Clarkson) is a web-based dashboard
# application that gives you a neat and clean interface for logging your fuel
# fill-ups for all of your vehicles. The application has full multi-user
# support, as well as multiple vehicles per user. Whenever you fill-up your car
# or motorcycle, keep the receipt and record the data in Clarkson.

source ./.env
docker run -d \
  --name=clarkson \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e MYSQL_HOST=<mysql_host> `# Points the backend to the MySQL database. This can be either a docker hostname or an IP.` \
  -e MYSQL_USERNAME=<mysql_username> `# The user with access to the _clarkson_ schema.` \
  -e MYSQL_PASSWORD=<mysql_password> `# The password for the user.` \
  -e ENABLE_REGISTRATIONS=<true/false> `# **Defaults to _false_.** If set to _true_, allows new users to register.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# WebUI` \
  --restart unless-stopped \
  ghcr.io/linuxserver/clarkson
