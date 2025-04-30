# [Netbootxyz](https://netboot.xyz) is a way to PXE boot various operating
# system installers or utilities from one place within the BIOS without the need
# of having to go retrieve the media to run the tool. iPXE is used to provide a
# user friendly menu from within the BIOS that lets you easily choose the
# operating system you want along with any specific types of versions or
# bootable flags.

. ./.env
docker run -d \
  --name=netbootxyz \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e MENU_VERSION=1.9.9 `# optional` `# Specify a specific version of boot files you want to use from NETBOOT.XYZ (unset pulls latest)` \
  -e PORT_RANGE=30000:30010 `# optional` `# Specify the port range tftp will use for data transfers [(see Wikipedia)](https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol#Details)` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder if running this behind a reverse proxy (IE /proxy/)` \
  -e NGINX_PORT=80 `# optional` `# Specify a different internal port for the asset server` \
  -e WEB_APP_PORT=3000 `# optional` `# Specify a different internal port for the configuration UI` \
  -p 3000:3000 `# Web configuration interface.` \
  -p 69:69/udp `# TFTP Port.` \
  -p 8080:80 `# optional` `# NGINX server for hosting assets.` \
  -v ${BASEDIR:-/volume1/docker}/netbootxyz/config:/config `# Storage for boot menu files and web application config` \
  -v ${BASEDIR:-/volume1/docker}/netbootxyz/assets:/assets `# optional` `# Storage for NETBOOT.XYZ bootable assets (live CDs and other files)` \
  --restart unless-stopped \
  lscr.io/linuxserver/netbootxyz:latest
