# [Luanti](https://www.luanti.org/) (formerly Minetest) is an open source voxel
# game-creation platform with easy modding and game creation

. ./.env
docker run -d \
  --name=luanti \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CLI_ARGS=--gameid devtest `# Optionally specify any [CLI variables](https://wiki.luanti.net/Command_line) you want to launch the app with [OPTIONAL]` \
  -p 30000:30000/udp `# Port Luanti listens on (UDP).` \
  -v ${BASEDIR:-/srv/lsio}/luanti/config/.minetest:/config/.minetest `# Where luanti stores config files and maps etc.` \
  --restart unless-stopped \
  lscr.io/linuxserver/luanti:latest
