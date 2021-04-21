# [Dokuwiki](https://www.dokuwiki.org/dokuwiki/) is a simple to use and highly
# versatile Open Source wiki software that doesn't require a database. It is
# loved by users for its clean and readable syntax. The ease of maintenance,
# backup and integration makes it an administrator's favorite. Built in access
# controls and authentication connectors make DokuWiki especially useful in the
# enterprise context and the large number of plugins contributed by its vibrant
# community allow for a broad range of use cases beyond a traditional wiki.

source ./.env
docker run -d \
  --name=dokuwiki \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# Application HTTP Port` \
  -p 443:443 `# optional` `# #optional Application HTTPS Port` \
  -v ${BASEDIR:-/volume1/docker}/dokuwiki/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/dokuwiki
