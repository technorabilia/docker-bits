# [Projectsend](http://www.projectsend.org) is a self-hosted application that
# lets you upload files and assign them to specific clients that you create
# yourself. Secure, private and easy. No more depending on external services or
# e-mail to send those files.

. ./.env
docker run -d \
  --name=projectsend \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/projectsend/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/projectsend/data:/data `# Where to store files to share.` \
  --restart unless-stopped \
  lscr.io/linuxserver/projectsend:latest
