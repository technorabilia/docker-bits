# [Ngircd](https://ngircd.barton.de/) is a free, portable and lightweight
# Internet Relay Chat server for small or private networks, developed under the
# GNU General Public License (GPL). It is easy to configure, can cope with
# dynamic IP addresses, and supports IPv6, SSL-protected connections as well as
# PAM for authentication. It is written from scratch and not based on the
# original IRCd.

. ./.env
docker run -d \
  --name=ngircd \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 6667:6667 `# ngircd port` \
  -v ${BASEDIR:-/srv/lsio}/ngircd/config:/config `# Where `ngircd.conf` is stored` \
  --restart unless-stopped \
  lscr.io/linuxserver/ngircd:latest
