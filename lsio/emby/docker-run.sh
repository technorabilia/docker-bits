# [Emby](https://emby.media/) organizes video, music, live TV, and photos from
# personal media libraries and streams them to smart TVs, streaming boxes and
# mobile devices. This container is packaged as a standalone emby Media Server.

. ./.env
docker run -d \
  --name=emby \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8096:8096 `# Http webUI.` \
  -p 8920:8920 `# Https webUI (you need to setup your own certificate). [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/emby/config:/config `# Emby data storage location. *This can grow very large, 50gb+ is likely for a large collection.*` \
  -v ${BASEDIR:-/srv/lsio}/emby/data/tvshows:/data/tvshows `# Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc.` \
  -v ${BASEDIR:-/srv/lsio}/emby/data/movies:/data/movies `# Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc.` \
  -v /opt/vc/lib:/opt/vc/lib `# Path for Raspberry Pi OpenMAX libs *optional*. [OPTIONAL]` \
  --device /dev/dri:/dev/dri `# Only needed if you want to use your Intel or AMD GPU for hardware accelerated video encoding (vaapi). [OPTIONAL]` \
  --device /dev/vchiq:/dev/vchiq `# Only needed if you want to use your Raspberry Pi OpenMax video encoding (Bellagio). [OPTIONAL]` \
  --device /dev/video10:/dev/video10 `# Only needed if you want to use your Raspberry Pi V4L2 video encoding. [OPTIONAL]` \
  --device /dev/video11:/dev/video11 `# Only needed if you want to use your Raspberry Pi V4L2 video encoding. [OPTIONAL]` \
  --device /dev/video12:/dev/video12 `# Only needed if you want to use your Raspberry Pi V4L2 video encoding. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/emby:latest
