# [Planka](https://github.com/plankanban/planka/) is an elegant open source
# project tracking tool.

. ./.env
docker run -d \
  --name=planka \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e BASE_URL=https://planka.example.com `# The URL you will use to access planka including protocol, and port if not 80/443.` \
  -e DATABASE_URL=postgresql://user:password@planka-db:5432/planka `# Postgres database URL. Special characters must be [url encoded](https://en.wikipedia.org/wiki/Percent-encoding).` \
  -e DEFAULT_ADMIN_EMAIL=demo@demo.demo `# Email address for default user.` \
  -e DEFAULT_ADMIN_USERNAME=demo `# Username for default user.` \
  -e DEFAULT_ADMIN_PASSWORD=demo `# Password for default user.` \
  -e DEFAULT_ADMIN_NAME=Demo User `# Display name for default user.` \
  -e SECRET_KEY=notasecretkey `# Session encryption key, recommended 32-64 character alphanumeric.` \
  -e TRUST_PROXY=0 `# Set to `1` to trust upstream proxies if reverse proxying.` \
  -p 1337:1337 `# Planka web UI.` \
  -v ${BASEDIR:-/volume1/docker}/planka/config:/config `# Local path for planka config files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/planka
