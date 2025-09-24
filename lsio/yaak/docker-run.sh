# [Yaak](https://yaak.app/) is a desktop API client for organizing and executing
# REST, GraphQL, and gRPC requests. It's built using
# [Tauri](https://tauri.app/), [Rust](https://www.rust-lang.org/), and
# [ReactJS](https://react.dev/).

. ./.env
docker run -d \
  --name=yaak \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Yaak desktop gui (for reverse proxy only).` \
  -p 3001:3001 `# Yaak desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/yaak/config:/config `# Where yaak should store its config and data.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/yaak:latest
