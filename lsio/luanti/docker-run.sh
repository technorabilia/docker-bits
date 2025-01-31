# [Luanti](https://www.luanti.org/) (formerly Minetest) is an open source voxel
# game-creation platform with easy modding and game creation

. ./.env
docker run -d \
  --name=luanti \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CLI_ARGS=--gameid devtest `# optional` `# Optionally specify any [CLI variables](https://wiki.luanti.net/Command_line) you want to launch the app with` \
  -p 30000:30000/udp `# Port Luanti listens on (UDP).` \
  -v ${BASEDIR:-/volume1/docker}/luanti/config/.minetest:/config/.minetest `# Where luanti stores config files and maps etc.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/luanti
