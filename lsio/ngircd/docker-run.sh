# [Ngircd](https://ngircd.barton.de/) is a free, portable and lightweight
# Internet Relay Chat server for small or private networks, developed under the
# GNU General Public License (GPL). It is easy to configure, can cope with
# dynamic IP addresses, and supports IPv6, SSL-protected connections as well as
# PAM for authentication. It is written from scratch and not based on the
# original IRCd.

source ./.env
docker run -d \
  --name=ngircd \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 6667:6667 `# ngircd port` \
  -v ${BASEDIR:-/volume1/docker}/ngircd/config:/config `# Where `ngircd.conf` is stored` \
  --restart unless-stopped \
  ghcr.io/linuxserver/ngircd
