# Grocy is an ERP system for your kitchen! Cut down on food waste, and manage
# your chores with this brilliant utility.  Keep track of your purchases, how
# much food you are wasting, what chores need doing and what batteries need
# charging with this proudly Open Source tool  For more information on grocy
# visit their website and check it out: https://grocy.info

source ./.env
docker run -d \
  --name=grocy \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 9283:80 `# will map the container's port 80 to port 9283 on the host` \
  -v ${BASEDIR:-/volume1/docker}/grocy/config:/config `# this will store any uploaded data on the docker host` \
  --restart unless-stopped \
  ghcr.io/linuxserver/grocy
