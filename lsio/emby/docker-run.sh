# [Emby](https://emby.media/) organizes video, music, live TV, and photos from
# personal media libraries and streams them to smart TVs, streaming boxes and
# mobile devices. This container is packaged as a standalone emby Media Server.

. ./.env
docker run -d \
  --name=emby \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8096:8096 `# Http webUI.` \
  -p 8920:8920 `# optional` `# Https webUI (you need to setup your own certificate).` \
  -v ${BASEDIR:-/volume1/docker}/emby/config:/config `# Emby data storage location. *This can grow very large, 50gb+ is likely for a large collection.*` \
  -v ${BASEDIR:-/volume1/docker}/emby/data/tvshows:/data/tvshows `# Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc.` \
  -v ${BASEDIR:-/volume1/docker}/emby/data/movies:/data/movies `# Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc.` \
  -v /opt/vc/lib:/opt/vc/lib `# optional` `# Path for Raspberry Pi OpenMAX libs *optional*.` \
  --device /dev/dri:/dev/dri `# optional` `# Only needed if you want to use your Intel or AMD GPU for hardware accelerated video encoding (vaapi).` \
  --device /dev/vchiq:/dev/vchiq `# optional` `# Only needed if you want to use your Raspberry Pi OpenMax video encoding (Bellagio).` \
  --device /dev/video10:/dev/video10 `# optional` `# Only needed if you want to use your Raspberry Pi V4L2 video encoding.` \
  --device /dev/video11:/dev/video11 `# optional` `# Only needed if you want to use your Raspberry Pi V4L2 video encoding.` \
  --device /dev/video12:/dev/video12 `# optional` `# Only needed if you want to use your Raspberry Pi V4L2 video encoding.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/emby
