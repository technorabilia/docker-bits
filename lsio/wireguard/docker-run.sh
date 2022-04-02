# [WireGuard®](https://www.wireguard.com/) is an extremely simple yet fast and
# modern VPN that utilizes state-of-the-art cryptography. It aims to be faster,
# simpler, leaner, and more useful than IPsec, while avoiding the massive
# headache. It intends to be considerably more performant than OpenVPN.
# WireGuard is designed as a general purpose VPN for running on embedded
# interfaces and super computers alike, fit for many different circumstances.
# Initially released for the Linux kernel, it is now cross-platform (Windows,
# macOS, BSD, iOS, Android) and widely deployable. It is currently under heavy
# development, but already it might be regarded as the most secure, easiest to
# use, and simplest VPN solution in the industry.

source ./.env
docker run -d \
  --name=wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SERVERURL=wireguard.domain.com `# optional` `# External IP or domain name for docker host. Used in server mode. If set to `auto`, the container will try to determine and set the external IP automatically` \
  -e SERVERPORT=51820 `# optional` `# External port for docker host. Used in server mode.` \
  -e PEERS=1 `# optional` `# Number of peers to create confs for. Required for server mode. Can also be a list of names: `myPC,myPhone,myTablet` (alphanumeric only)` \
  -e PEERDNS=auto `# optional` `# DNS server set in peer/client configs (can be set as `8.8.8.8`). Used in server mode. Defaults to `auto`, which uses wireguard docker host's DNS via included CoreDNS forward.` \
  -e INTERNAL_SUBNET=10.13.13.0 `# optional` `# Internal subnet for the wireguard and server and peers (only change if it clashes). Used in server mode.` \
  -e ALLOWEDIPS=0.0.0.0/0 `# optional` `# The IPs/Ranges that the peers will be able to reach using the VPN connection. If not specified the default value is: '0.0.0.0/0, ::0/0' This will cause ALL traffic to route through the VPN, if you want split tunneling, set this to only the IPs you would like to use the tunnel AND the ip of the server's WG ip, such as 10.13.13.1.` \
  -p 51820:51820/udp `# wireguard port` \
  -v ${BASEDIR:-/volume1/docker}/wireguard/config:/config `# Contains all relevant configuration files.` \
  -v /lib/modules:/lib/modules `# Maps host's modules folder.` \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart unless-stopped \
  ghcr.io/linuxserver/wireguard
