# [Grocy](https://github.com/grocy/grocy) is an ERP system for your kitchen! Cut
# down on food waste, and manage your chores with this brilliant utility. Keep
# track of your purchases, how much food you are wasting, what chores need doing
# and what batteries need charging with this proudly Open Source tool For more
# information on grocy visit their website and check it out: https://grocy.info

. ./.env
docker run -d \
  --name=grocy \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 9283:80 `# will map the container's port 80 to port 9283 on the host` \
  -v ${BASEDIR:-/volume1/docker}/grocy/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/grocy
