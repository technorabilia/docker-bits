# [Vscodium-web](https://vscodium.com/) is a community-driven, freely-licensed
# binary distribution of the remote host web component of Microsoft's editor VS
# Code.

. ./.env
docker run -d \
  --name=vscodium-web \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CONNECTION_TOKEN= `# Optional security token for accessing the Web UI (ie. `supersecrettoken`). [OPTIONAL]` \
  -e CONNECTION_TOKEN_FILE= `# Optional path to a file inside the container that contains the security token for accessing the Web UI (ie. `/path/to/file`). Overrides `CONNECTION_TOKEN`. [OPTIONAL]` \
  -e SUDO_PASSWORD=password `# If this optional variable is set, user will have sudo access in the vscodium-web terminal with the specified password. [OPTIONAL]` \
  -e SUDO_PASSWORD_HASH= `# Optionally set sudo password via hash (takes priority over `SUDO_PASSWORD` var). Format is `$type$salt$hashed`. [OPTIONAL]` \
  -e CODE_ARGS= `# Optionally add cli parameters to vscodium binary. [OPTIONAL]` \
  -p 8000:8000 `# Web UI port.` \
  -v ${BASEDIR:-/srv/lsio}/vscodium-web/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/vscodium-web:latest
