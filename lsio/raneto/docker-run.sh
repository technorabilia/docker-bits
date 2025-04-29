# [Raneto](http://raneto.com/) - is an open source Knowledgebase platform that
# uses static Markdown files to power your Knowledgebase.

. ./.env
docker run -d \
  --name=raneto \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# The port for the Raneto web interface` \
  -v ${BASEDIR:-/volume1/docker}/raneto/config:/config `# Raneto config and Markdown files` \
  --restart unless-stopped \
  lscr.io/linuxserver/raneto:latest
