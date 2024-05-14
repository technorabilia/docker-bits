# [Minetest](http://www.minetest.net/) (server) is a near-infinite-world block
# sandbox game and a game engine, inspired by InfiniMiner, Minecraft, and the
# like.

. ./.env
docker run -d \
  --name=minetest \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CLI_ARGS=--gameid devtest `# optional` `# Optionally specify any [CLI variables](https://wiki.minetest.net/Command_line) you want to launch the app with` \
  -p 30000:30000/udp `# Port Minetest listens on (UDP).` \
  -v ${BASEDIR:-/volume1/docker}/minetest/config/.minetest:/config/.minetest `# Where minetest stores config files and maps etc.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/minetest
