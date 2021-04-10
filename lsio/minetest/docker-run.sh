# Minetest (server) is a near-infinite-world block sandbox game and a game
# engine, inspired by InfiniMiner, Minecraft, and the like.

source ./.env
docker run -d \
  --name=minetest \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CLI_ARGS="--gameid minetest" `# optional` `# Optionally specify any [CLI variables](https://wiki.minetest.net/Command_line) you want to launch the app with` \
  -p 30000:30000/udp `# Port Minetest listens on.` \
  -v ${BASEDIR:-/volume1/docker}/minetest/config/.minetest:/config/.minetest `# Where minetest stores config files and maps etc.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/minetest
