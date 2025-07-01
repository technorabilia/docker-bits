# [Sabnzbd](http://sabnzbd.org/) makes Usenet as simple and streamlined as
# possible by automating everything we can. All you have to do is add an .nzb.
# SABnzbd takes over from there, where it will be automatically downloaded,
# verified, repaired, extracted and filed away with zero human interaction.

. ./.env
docker run -d \
  --name=sabnzbd \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8080:8080 `# HTTP port for the WebUI.` \
  -v ${BASEDIR:-/srv/lsio}/sabnzbd/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/srv/lsio}/sabnzbd/incomplete-downloads:/incomplete-downloads `# Local path for incomplete-downloads. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/sabnzbd/downloads:/downloads `# Local path for finished downloads. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/sabnzbd:latest
