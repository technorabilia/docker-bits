# [Tvheadend](https://www.tvheadend.org/) works as a proxy server: is a TV
# streaming server and recorder for Linux, FreeBSD and Android supporting DVB-S,
# DVB-S2, DVB-C, DVB-T, ATSC, ISDB-T, IPTV, SAT>IP and HDHomeRun as input
# sources. Tvheadend offers the HTTP (VLC, MPlayer), HTSP (Kodi, Movian) and
# SAT>IP streaming. Multiple EPG sources are supported (over-the-air DVB and
# ATSC including OpenTV DVB extensions, XMLTV, PyXML).

. ./.env
docker run -d \
  --name=tvheadend \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e RUN_OPTS= `# Optionally specify additional arguments to be passed. See Additional runtime parameters. [OPTIONAL]` \
  -p 9981:9981 `# WebUI` \
  -p 9982:9982 `# HTSP server port.` \
  -v ${BASEDIR:-/volume1/docker}/tvheadend/config:/config `# Where TVHeadend show store it's config files.` \
  -v ${BASEDIR:-/volume1/docker}/tvheadend/recordings:/recordings `# Where you want the PVR to store recordings.` \
  --device /dev/dri:/dev/dri `# Only needed if you want to use your AMD/Intel GPU for hardware accelerated video encoding (vaapi). [OPTIONAL]` \
  --device /dev/dvb:/dev/dvb `# Only needed if you want to pass through a DVB card to the container. If you use IPTV or HDHomeRun you can leave it out. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/tvheadend:latest
