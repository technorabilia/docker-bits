# [Apprise-api](https://github.com/caronc/apprise-api) Takes advantage of
# [Apprise](https://github.com/caronc/apprise) through your network with a user-
# friendly API. * Send notifications to more than 100 services. * An incredibly
# lightweight gateway to Apprise. * A production ready micro-service at your
# disposal. * A Simple Website to verify and test your configuration with.
# Apprise API was designed to easily fit into existing (and new) eco-systems
# that are looking for a simple notification solution.

. ./.env
docker run -d \
  --name=apprise-api \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e APPRISE_ATTACH_SIZE=0 `# optional` `# Max attachment size in Mb. `0` disables attachments. Must have `/attachments` mounted to set to a positive value.` \
  -p 8000:8000 `# Port for apprise's interface and API.` \
  -v ${BASEDIR:-/volume1/docker}/apprise-api/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/apprise-api/attachments:/attachments `# optional` `# Temporary storage for attachments when sent with notifications.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/apprise-api
