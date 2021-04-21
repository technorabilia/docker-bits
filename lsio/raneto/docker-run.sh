# [Raneto](http://raneto.com/) - is an open source Knowledgebase platform that
# uses static Markdown files to power your Knowledgebase.

source ./.env
docker run -d \
  --name=raneto \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# The port for the Raneto web interface` \
  -v ${BASEDIR:-/volume1/docker}/raneto/config:/config `# Raneto config and Markdown files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/raneto
