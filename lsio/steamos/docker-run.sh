# [SteamOS](https://www.steamdeck.com/) is an Arch based Linux distribution made
# by Valve Software. This container is a vanilla Arch install with Steam
# repositories added for software support. **This container will only work with
# modern AMD/Intel GPUs on a real Linux Host**

. ./.env
docker run -d \
  --name=steamos \
    --hostname=hostname `# Specify the hostname of the host, this is useful for keeping a persistent hostname between upgrades and identifying the server in the remote play Steam Client. [OPTIONAL]` \
  --cap-add=NET_ADMIN \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DRINODE=/dev/dri/renderD128 `# Specify the render device (GPU) for the contianer to use.` \
  -e HOST_IP=192.168.100.10 `# Specify the IP of the host, needed for LAN Remote Play. [OPTIONAL]` \
  -e STARTUP=KDE `# KDE to boot into desktop mode, BIGPICTURE to boot into gamescope. [OPTIONAL]` \
  -e RESOLUTION=1920x1080 `# When booting into BIGPICTURE mode the screen resolution will be bound to this value. [OPTIONAL]` \
  -p 3000:3000 `# SteamOS desktop gui.` \
  -p 3001:3001 `# HTTPS SteamOS desktop gui.` \
  -p 27031-27036:27031-27036/udp `# Steam Remote Play Ports (UDP). [OPTIONAL]` \
  -p 27031-27036:27031-27036 `# Steam Remote Play Ports (TCP). [OPTIONAL]` \
  -p 47984-47990:47984-47990 `# Sunshine Ports (TCP). [OPTIONAL]` \
  -p 48010-48010:48010-48010 `# Sunshine Ports (TCP). [OPTIONAL]` \
  -p 47998-48000:47998-48000/udp `# Sunshine Ports (UDP). [OPTIONAL]` \
  -v ${BASEDIR:-/volume1/docker}/steamos/config:/config `# Users home directory in the container, stores all files and games.` \
  -v /dev/input:/dev/input `# Optional for gamepad support. *Only working for Steam Remote Play [OPTIONAL]` \
  -v /run/udev/data:/run/udev/data `# Optional for gamepad support. *Only working for Steam Remote Play [OPTIONAL]` \
  --device /dev/dri:/dev/dri `# Video card passthrough to Steam.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/steamos:latest
