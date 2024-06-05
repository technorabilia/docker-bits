# [Netbox](https://github.com/netbox-community/netbox) is an IP address
# management (IPAM) and data center infrastructure management (DCIM) tool.
# Initially conceived by the network engineering team at DigitalOcean, NetBox
# was developed specifically to address the needs of network and infrastructure
# engineers. It is intended to function as a domain-specific source of truth for
# network operations.

. ./.env
docker run -d \
  --name=netbox \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SUPERUSER_EMAIL= `# Email address for `admin` account` \
  -e SUPERUSER_PASSWORD= `# Password for `admin` account` \
  -e ALLOWED_HOST= `# The hostname you will use to access the app (i.e., netbox.example.com)` \
  -e DB_NAME= `# Database name (default: netbox)` \
  -e DB_USER= `# Database user` \
  -e DB_PASSWORD= `# Database password` \
  -e DB_HOST= `# Database host (default: postgres)` \
  -e DB_PORT= `# Database port (default: 5432)` \
  -e REDIS_HOST= `# Redis host (default: redis)` \
  -e REDIS_PORT= `# Redis port number (default: 6379)` \
  -e REDIS_PASSWORD= `# Redis password (default: none)` \
  -e REDIS_DB_TASK= `# Redis database ID for tasks (default: 0)` \
  -e REDIS_DB_CACHE= `# Redis database ID for caching (default: 1)` \
  -e BASE_PATH= `# optional` `# The path you will use to access the app (i.e., /netbox, optional, default: none)` \
  -e REMOTE_AUTH_ENABLED= `# optional` `# Enable remote authentication (optional, default: False)` \
  -e REMOTE_AUTH_BACKEND= `# optional` `# Python path to the custom Django authentication backend to use for external user authentication (optional, default: netbox.authentication.RemoteUserBackend)` \
  -e REMOTE_AUTH_HEADER= `# optional` `# Name of the HTTP header which informs NetBox of the currently authenticated user. (optional, default: HTTP_REMOTE_USER)` \
  -e REMOTE_AUTH_AUTO_CREATE_USER= `# optional` `# If true, NetBox will automatically create local accounts for users authenticated via a remote service (optional, default: False)` \
  -e REMOTE_AUTH_DEFAULT_GROUPS= `# optional` `# The list of groups to assign a new user account when created using remote authentication (optional, default: [])` \
  -e REMOTE_AUTH_DEFAULT_PERMISSIONS= `# optional` `# A mapping of permissions to assign a new user account when created using remote authentication (optional, default: {})` \
  -p 8000:8000 `# will map the container's port 8000 to port 8000 on the host` \
  -v ${BASEDIR:-/volume1/docker}/netbox/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/netbox
