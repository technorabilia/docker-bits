# [Feed2toot](https://gitlab.com/chaica/feed2toot) automatically parses rss
# feeds, identifies new posts and posts them on the Mastodon social network.

source ./.env
docker run -d \
  --name=feed2toot \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e FEED_LIMIT=5 `# optional` `# Limit number of RSS entries published at each execution.` \
  -v ${BASEDIR:-/volume1/docker}/feed2toot/config:/config `# Local path for feed2toot config files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/feed2toot
