# [Feed2toot](https://gitlab.com/chaica/feed2toot) automatically parses rss
# feeds, identifies new posts and posts them on the Mastodon social network.

. ./.env
docker run -d \
  --name=feed2toot \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e FEED_LIMIT=5 `# Limit number of RSS entries published at each execution. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/feed2toot/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/feed2toot:latest
