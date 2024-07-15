# [Ombi](https://ombi.io) allows you to host your own Plex Request and user
# management system. If you are sharing your Plex server with other users, allow
# them to request new content using an easy to manage interface! Manage all your
# requests for Movies and TV with ease, leave notes for the user and get
# notification when a user requests something. Allow your users to post issues
# against their requests so you know there is a problem with the audio etc. Even
# automatically send them weekly newsletters of new content that has been added
# to your Plex server!

. ./.env
docker run -d \
  --name=ombi \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e BASE_URL=/ `# optional` `# Subfolder can optionally be defined as an env variable for reverse proxies. Keep in mind that once this value is defined, the gui setting for base url no longer works. To use the gui setting, remove this env variable.` \
  -p 3579:3579 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/ombi/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/ombi
