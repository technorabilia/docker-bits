# [Sabnzbd](http://sabnzbd.org/) makes Usenet as simple and streamlined as
# possible by automating everything we can. All you have to do is add an .nzb.
# SABnzbd takes over from there, where it will be automatically downloaded,
# verified, repaired, extracted and filed away with zero human interaction.

. ./.env
docker run -d \
  --name=sabnzbd \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8080:8080 `# HTTP port for the WebUI.` \
  -v ${BASEDIR:-/volume1/docker}/sabnzbd/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/sabnzbd/downloads:/downloads `# optional` `# Local path for finished downloads.` \
  -v ${BASEDIR:-/volume1/docker}/sabnzbd/incomplete-downloads:/incomplete-downloads `# optional` `# Local path for incomplete-downloads.` \
  --restart unless-stopped \
  lscr.io/linuxserver/sabnzbd:latest
