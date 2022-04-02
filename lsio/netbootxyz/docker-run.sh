# [Netbootxyz](https://netboot.xyz) is a way to PXE boot various operating
# system installers or utilities from one place within the BIOS without the need
# of having to go retrieve the media to run the tool. iPXE is used to provide a
# user friendly menu from within the BIOS that lets you easily choose the
# operating system you want along with any specific types of versions or
# bootable flags.

source ./.env
docker run -d \
  --name=netbootxyz \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e MENU_VERSION=1.9.9 `# optional` `# Specify a specific version of boot files you want to use from NETBOOT.XYZ (unset pulls latest)` \
  -e PORT_RANGE=30000:30010 `# optional` `# Specify the port range tftp will use for data transfers [(see Wikipedia)](https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol#Details)` \
  -e SUBFOLDER=/ `# optional` `# Specify a sobfolder if running this behind a reverse proxy (IE /proxy/)` \
  -p 3000:3000 `# Web configuration interface.` \
  -p 69:69/udp `# TFTP Port.` \
  -p 8080:80 `# optional` `# NGINX server for hosting assets.` \
  -v ${BASEDIR:-/volume1/docker}/netbootxyz/config:/config `# Storage for boot menu files and web application config` \
  -v ${BASEDIR:-/volume1/docker}/netbootxyz/assets:/assets `# optional` `# Storage for NETBOOT.XYZ bootable assets (live CDs and other files)` \
  --restart unless-stopped \
  ghcr.io/linuxserver/netbootxyz
