# The [Mullvad Browser](https://mullvad.net/en/browser) is a privacy-focused web
# browser developed in a collaboration between Mullvad VPN and the Tor Project.
# It’s designed to minimize tracking and fingerprinting. You could say it’s a
# Tor Browser to use without the Tor Network. Instead, you can use it with a
# trustworthy VPN.

. ./.env
docker run -d \
  --name=mullvad-browser \
  --cap-add=NET_ADMIN \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e LOCAL_NET=192.168.0.0/16 `# If using a VPN, set this to your local LAN IP range using CIDR notation. Without it you will be unable to access the web interface. If you have multiple ranges or a complex LAN setup you will need to manage this yourself in the wg0.conf, see the App Setup section for details. [OPTIONAL]` \
  -p 3000:3000 `# Mullvad Browser GUI.` \
  -p 3001:3001 `# Mullvad Browser GUI HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/mullvad-browser/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/mullvad-browser:latest
