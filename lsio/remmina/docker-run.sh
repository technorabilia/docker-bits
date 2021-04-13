# [Remmina]({{ project_url }}) is a remote desktop client written in GTK, aiming
# to be useful for system administrators and travellers, who need to work with
# lots of remote computers in front of either large or tiny screens. Remmina
# supports multiple network protocols, in an integrated and consistent user
# interface. Currently RDP, VNC, SPICE, NX, XDMCP, SSH and EXEC are supported.

source ./.env
docker run -d \
  --name=remmina \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# Remmina desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/remmina/config:/config `# Users home directory in the container, stores program settings.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/remmina
