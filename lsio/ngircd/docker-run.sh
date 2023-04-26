# [Ngircd](https://ngircd.barton.de/) is a free, portable and lightweight
# Internet Relay Chat server for small or private networks, developed under the
# GNU General Public License (GPL). It is easy to configure, can cope with
# dynamic IP addresses, and supports IPv6, SSL-protected connections as well as
# PAM for authentication. It is written from scratch and not based on the
# original IRCd.

. ./.env
docker run -d \
  --name=ngircd \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 6667:6667 `# ngircd port` \
  -v ${BASEDIR:-/volume1/docker}/ngircd/config:/config `# Where `ngircd.conf` is stored` \
  --restart unless-stopped \
  ghcr.io/linuxserver/ngircd
