# [Jellyfin](https://github.com/jellyfin/jellyfin) is a Free Software Media
# System that puts you in control of managing and streaming your media. It is an
# alternative to the proprietary Emby and Plex, to provide media from a
# dedicated server to end-user devices via multiple apps. Jellyfin is descended
# from Emby's 3.5.2 release and ported to the .NET Core framework to enable full
# cross-platform support. There are no strings attached, no premium licenses or
# features, and no hidden agendas: just a team who want to build something
# better and work together to achieve it.

. ./.env
docker run -d \
  --name=jellyfin \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e JELLYFIN_PublishedServerUrl=http://192.168.0.5 `# optional` `# Set the autodiscovery response domain or IP address, include http(s)://.` \
  -p 8096:8096 `# Http webUI.` \
  -p 8920:8920 `# optional` `# Optional - Https webUI (you need to set up your own certificate).` \
  -p 7359:7359/udp `# optional` `# Optional - Allows clients to discover Jellyfin on the local network.` \
  -p 1900:1900/udp `# optional` `# Optional - Service discovery used by DNLA and clients.` \
  -v ${BASEDIR:-/volume1/docker}/jellyfin/config:/config `# Jellyfin data storage location. *This can grow very large, 50gb+ is likely for a large collection.*` \
  -v ${BASEDIR:-/volume1/docker}/jellyfin/data/tvshows:/data/tvshows `# Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc.` \
  -v ${BASEDIR:-/volume1/docker}/jellyfin/data/movies:/data/movies `# Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/jellyfin
