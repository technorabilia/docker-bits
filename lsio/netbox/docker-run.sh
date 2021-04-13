# Netbox is an IP address management (IPAM) and data center infrastructure
# management (DCIM) tool. Initially conceived by the network engineering team at
# DigitalOcean, NetBox was developed specifically to address the needs of
# network and infrastructure engineers. It is intended to function as a domain-
# specific source of truth for network operations.

source ./.env
docker run -d \
  --name=netbox \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e SUPERUSER_EMAIL=<SUPERUSER_EMAIL> `# Username for admin account` \
  -e SUPERUSER_PASSWORD=<SUPERUSER_PASSWORD> `# Password for admin account` \
  -e ALLOWED_HOST=<ALLOWED_HOST> `# The hostname you will use to access the app (i.e., netbox.example.com)` \
  -e BASE_PATH=<BASE_PATH> `# The path you will use to access the app (i.e., /netbox, optional, default: none)` \
  -e DB_NAME=<DB_NAME> `# Database name (optional, default: netbox)` \
  -e DB_USER=<DB_USER> `# Database user` \
  -e DB_PASSWORD=<DB_PASSWORD> `# Database password` \
  -e DB_HOST=<DB_HOST> `# Database host (optional, default: postgres)` \
  -e DB_PORT=<DB_PORT> `# Database port (optional)` \
  -e REDIS_HOST=<REDIS_HOST> `# Redis host (optional, default: redis)` \
  -e REDIS_PORT=<REDIS_PORT> `# Redis port number (optional, default: 6379)` \
  -e REDIS_PASSWORD=<REDIS_PASSWORD> `# Redis password (optional, default: none)` \
  -e REMOTE_AUTH_ENABLED=<REMOTE_AUTH_ENABLED> `# Enable remote authentication (optional, default: False` \
  -e REMOTE_AUTH_BACKEND=<REMOTE_AUTH_BACKEND> `# Python path to the custom Django authentication backend to use for external user authentication (optional, default: netbox.authentication.RemoteUserBackend` \
  -e REMOTE_AUTH_HEADER=<REMOTE_AUTH_HEADER> `# Name of the HTTP header which informs NetBox of the currently authenticated user. (optional, default: HTTP_REMOTE_USER` \
  -e REMOTE_AUTH_AUTO_CREATE_USER=<REMOTE_AUTH_AUTO_CREATE_USER> `# If true, NetBox will automatically create local accounts for users authenticated via a remote service (optional, default: False` \
  -e REMOTE_AUTH_DEFAULT_GROUPS=<REMOTE_AUTH_DEFAULT_GROUPS> `# The list of groups to assign a new user account when created using remote authentication (optional, default: []` \
  -e REMOTE_AUTH_DEFAULT_PERMISSIONS=<REMOTE_AUTH_DEFAULT_PERMISSIONS> `# A mapping of permissions to assign a new user account when created using remote authentication (optional, default: {}` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8000:8000 `# will map the container's port 8000 to port 8000 on the host` \
  -v ${BASEDIR:-/volume1/docker}/netbox/config:/config `# config directory volume mapping` \
  --restart unless-stopped \
  ghcr.io/linuxserver/netbox
