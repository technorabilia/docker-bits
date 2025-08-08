# [Ombi](https://ombi.io) allows you to host your own Plex Request and user
# management system. If you are sharing your Plex server with other users, allow
# them to request new content using an easy to manage interface! Manage all your
# requests for Movies and TV with ease, leave notes for the user and get
# notification when a user requests something. Allow your users to post issues
# against their requests so you know there is a problem with the audio etc. Even
# automatically sent them weekly newsletters of new content that has been added
# to your Plex server!

. ./.env
docker run -d \
  --name=ombi \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e BASE_URL=/ `# Subfolder can optionally be defined as an env variable for reverse proxies. Keep in mind that once this value is defined, the gui setting for base url no longer works. To use the gui setting, remove this env variable. [OPTIONAL]` \
  -p 3579:3579 `# web gui` \
  -v ${BASEDIR:-/srv/lsio}/ombi/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/ombi:latest
