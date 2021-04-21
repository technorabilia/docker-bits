# [Calibre](https://calibre-ebook.com/) is a powerful and easy to use e-book
# manager. Users say it’s outstanding and a must-have. It’ll allow you to do
# nearly everything and it takes things a step beyond normal e-book software.
# It’s also completely free and open source and great for both casual users and
# computer experts.

source ./.env
docker run -d \
  --name=calibre \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e PASSWORD= `# optional` `# Optionally set a password for the gui.` \
  -e CLI_ARGS= `# optional` `# Optionally pass cli start arguments to calibre.` \
  -p 8080:8080 `# Calibre desktop gui.` \
  -p 8081:8081 `# Calibre webserver gui.` \
  -v ${BASEDIR:-/volume1/docker}/calibre/config:/config `# Where calibre should store its database and library.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/calibre
