# Openvpn-as is a full featured secure network tunneling VPN software solution
# that integrates OpenVPN server capabilities, enterprise management
# capabilities, simplified OpenVPN Connect UI, and OpenVPN Client software
# packages that accommodate Windows, MAC, Linux, Android, and iOS environments.
# OpenVPN Access Server supports a wide range of configurations, including
# secure and granular remote access to internal network and/ or private cloud
# network resources and applications with fine-grained access control.

source ./.env
docker run -d \
  --name=openvpn-as \
  --cap-add=NET_ADMIN \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e INTERFACE=eth0 `# optional` `# With bridge networking, leave it as eth0 (or don't include at all), if host or macvlan, set it to your host's network interface, found by running `ifconfig`` \
  -p 943:943 `# Admin GUI port.` \
  -p 9443:9443 `# TCP port.` \
  -p 1194:1194/udp `# UDP port.` \
  -v ${BASEDIR:-/volume1/docker}/openvpn-as/config:/config `# Where openvpn-as should store configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/openvpn-as
