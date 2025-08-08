# [Planka](https://github.com/plankanban/planka/) is an elegant open source
# project tracking tool.

. ./.env
docker run -d \
  --name=planka \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e BASE_URL=https://planka.example.com `# The URL you will use to access planka including protocol, and port if not 80/443.` \
  -e DATABASE_URL=postgresql://user:password@planka-db:5432/planka `# Postgres database URL. Special characters must be [url encoded](https://en.wikipedia.org/wiki/Percent-encoding).` \
  -e SECRET_KEY=notasecretkey `# Session encryption key, recommended 32-64 character alphanumeric.` \
  -e TRUST_PROXY=0 `# Set to `1` to trust upstream proxies if reverse proxying.` \
  -p 1337:1337 `# Planka web UI.` \
  -v ${BASEDIR:-/srv/lsio}/planka/config:/config `# Local path for planka config files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/planka:latest
