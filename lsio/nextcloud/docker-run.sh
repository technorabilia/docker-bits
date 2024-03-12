# [Nextcloud](https://nextcloud.com/) gives you access to all your files
# wherever you are. Where are your photos and documents? With Nextcloud you pick
# a server of your choice, at home, in a data center or at a provider. And that
# is where your files will be. Nextcloud runs on that server, protecting your
# data and giving you access from your desktop or mobile devices. Through
# Nextcloud you also access, sync and share your existing data on that FTP drive
# at the office, a Dropbox or a NAS you have at home.

. ./.env
docker run -d \
  --name=nextcloud \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 443:443 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/nextcloud/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/nextcloud/data:/data `# Your personal data.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/nextcloud
