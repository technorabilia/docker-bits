# Jellyfin is a Free Software Media System that puts you in control of managing
# and streaming your media. It is an alternative to the proprietary Emby and
# Plex, to provide media from a dedicated server to end-user devices via
# multiple apps. Jellyfin is descended from Emby's 3.5.2 release and ported to
# the .NET Core framework to enable full cross-platform support. There are no
# strings attached, no premium licenses or features, and no hidden agendas: just
# a team who want to build something better and work together to achieve it.

source ./.env
docker run -d \
  --name=jellyfin \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -e JELLYFIN_PublishedServerUrl=192.168.0.5 `# optional` `# Set the autodiscovery response domain or IP address.` \
  -p 8096:8096 `# Http webUI.` \
  -p 8920:8920 `# optional` `# Optional - Https webUI (you need to set up your own certificate).` \
  -p 7359:7359/udp `# optional` `# Optional - Allows clients to discover Jellyfin on the local network.` \
  -p 1900:1900/udp `# optional` `# Optional - Service discovery used by DNLA and clients.` \
  -v ${BASEDIR:-/volume1/docker}/jellyfin/config:/config `# Jellyfin data storage location. *This can grow very large, 50gb+ is likely for a large collection.*` \
  -v ${BASEDIR:-/volume1/docker}/jellyfin/data/tvshows:/data/tvshows `# Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc.` \
  -v ${BASEDIR:-/volume1/docker}/jellyfin/data/movies:/data/movies `# Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc.` \
  -v ${BASEDIR:-/volume1/docker}/jellyfin/opt/vc/lib:/opt/vc/lib `# optional` `# Path for Raspberry Pi OpenMAX libs *optional*.` \
  --device /dev/dri:/dev/dri `# optional` `# Only needed if you want to use your Intel GPU for hardware accelerated video encoding (vaapi).` \
  --device /dev/vcsm:/dev/vcsm `# optional` `# Only needed if you want to use your Raspberry Pi MMAL video decoding (Enabled as OpenMax H264 decode in gui settings).` \
  --device /dev/vchiq:/dev/vchiq `# optional` `# Only needed if you want to use your Raspberry Pi OpenMax video encoding.` \
  --device /dev/video10:/dev/video10 `# optional` `# Only needed if you want to use your Raspberry Pi V4L2 video encoding.` \
  --device /dev/video11:/dev/video11 `# optional` `# Only needed if you want to use your Raspberry Pi V4L2 video encoding.` \
  --device /dev/video12:/dev/video12 `# optional` `# Only needed if you want to use your Raspberry Pi V4L2 video encoding.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/jellyfin
