# [Wireshark]({{ project_url }}) is the world’s foremost and widely-used network
# protocol analyzer. It lets you see what’s happening on your network at a
# microscopic level and is the de facto (and often de jure) standard across many
# commercial and non-profit enterprises, government agencies, and educational
# institutions. Wireshark development thrives thanks to the volunteer
# contributions of networking experts around the globe and is the continuation
# of a project started by Gerald Combs in 1998.

source ./.env
docker run -d \
  --name=wireshark \
  --net=host `# Use Host Networking` \
  --cap-add=NET_ADMIN \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# optional` `# WireShark desktop gui, only use this if you are not using host mode and sniffing Docker network traffic.` \
  -v ${BASEDIR:-/volume1/docker}/wireshark/config:/config `# Users home directory in the container, stores program settings and potentially dump files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/wireshark
