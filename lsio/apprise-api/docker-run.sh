# [Apprise-api](https://github.com/caronc/apprise-api) Takes advantage of
# [Apprise](https://github.com/caronc/apprise) through your network with a user-
# friendly API. * Send notifications to more then 65+ services. * An incredibly
# lightweight gateway to Apprise. * A production ready micro-service at your
# disposal. Apprise API was designed to easily fit into existing (and new) eco-
# systems that are looking for a simple notification solution.

source ./.env
docker run -d \
  --name=apprise-api \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8000:8000 `# Port for apprise's interface and API.` \
  -v ${BASEDIR:-/volume1/docker}/apprise-api/config:/config `# Where config is stored.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/apprise-api
