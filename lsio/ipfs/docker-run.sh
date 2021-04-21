# [Ipfs](https://ipfs.io/) - A peer-to-peer hypermedia protocol designed to make
# the web faster, safer, and more open.

source ./.env
docker run -d \
  --name=ipfs \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# The port for the IPFS web UI` \
  -p 4001:4001 `# Peering port, this is the only port you should expose to the internet` \
  -p 5001:5001 `# API port, the clientside webUI needs to be able to talk to this from whatever machine your web browser is on` \
  -p 8080:8080 `# Gateway Port, actually serves IPFS content` \
  -p 443:443 `# optional` `# HTTPS port for web UI` \
  -v ${BASEDIR:-/volume1/docker}/ipfs/config:/config `# IPFS storage and config files/logs` \
  --restart unless-stopped \
  ghcr.io/linuxserver/ipfs
