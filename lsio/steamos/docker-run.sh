# [SteamOS](https://www.steamdeck.com/) is an Arch based Linux distribution made
# by Valve Software. This container is a vanilla Arch install with Steam
# repositories added for software support. **This container will only work with
# modern AMD/Intel GPUs on a real Linux Host**

. ./.env
docker run -d \
  --name=steamos \
    --hostname=hostname `# optional` `# Specify the hostname of the host, this is useful for keeping a persistent hostname between upgrades and identifying the server in the remote play Steam Client.` \
  --cap-add=NET_ADMIN \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DRINODE=/dev/dri/renderD128 `# Specify the render device (GPU) for the contianer to use.` \
  -e HOST_IP=192.168.100.10 `# optional` `# Specify the IP of the host, needed for LAN Remote Play.` \
  -e STARTUP=KDE `# optional` `# KDE to boot into desktop mode, BIGPICTURE to boot into gamescope.` \
  -e RESOLUTION=1920x1080 `# optional` `# When booting into BIGPICTURE mode the screen resolution will be bound to this value.` \
  -p 3000:3000 `# SteamOS desktop gui.` \
  -p 3001:3001 `# HTTPS SteamOS desktop gui.` \
  -p 27031-27036:27031-27036/udp `# optional` `# Steam Remote Play Ports (UDP).` \
  -p 27031-27036:27031-27036 `# optional` `# Steam Remote Play Ports (TCP).` \
  -p 47984-47990:47984-47990 `# optional` `# Sunshine Ports (TCP).` \
  -p 48010-48010:48010-48010 `# optional` `# Sunshine Ports (TCP).` \
  -p 47998-48000:47998-48000/udp `# optional` `# Sunshine Ports (UDP).` \
  -v ${BASEDIR:-/volume1/docker}/steamos/config:/config `# Users home directory in the container, stores all files and games.` \
  -v /dev/input:/dev/input `# optional` `# Optional for gamepad support. *Only working for Steam Remote Play` \
  -v /run/udev/data:/run/udev/data `# optional` `# Optional for gamepad support. *Only working for Steam Remote Play` \
  --device /dev/dri:/dev/dri `# Video card passthrough to Steam.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/steamos
