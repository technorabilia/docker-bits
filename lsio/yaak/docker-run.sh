# [Yaak](https://yaak.app/) is a desktop API client for organizing and executing
# REST, GraphQL, and gRPC requests. It's built using
# [Tauri](https://tauri.app/), [Rust](https://www.rust-lang.org/), and
# [ReactJS](https://react.dev/).

. ./.env
docker run -d \
  --name=yaak \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Yaak desktop gui.` \
  -p 3001:3001 `# Yaak desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/yaak/config:/config `# Where yaak should store its config and data.` \
  --restart unless-stopped \
  lscr.io/linuxserver/yaak:latest
