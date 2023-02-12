# [Sabnzbd](http://sabnzbd.org/) makes Usenet as simple and streamlined as
# possible by automating everything we can. All you have to do is add an .nzb.
# SABnzbd takes over from there, where it will be automatically downloaded,
# verified, repaired, extracted and filed away with zero human interaction.

source ./.env
docker run -d \
  --name=sabnzbd \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8080:8080 `# HTTP port for the WebUI.` \
  -v ${BASEDIR:-/volume1/docker}/sabnzbd/config:/config `# Local path for sabnzbd config files.` \
  -v ${BASEDIR:-/volume1/docker}/sabnzbd/downloads:/downloads `# optional` `# Local path for finished downloads.` \
  -v ${BASEDIR:-/volume1/docker}/sabnzbd/incomplete-downloads:/incomplete-downloads `# optional` `# Local path for incomplete-downloads.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/sabnzbd
