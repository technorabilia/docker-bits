# [Healthchecks](https://github.com/healthchecks/healthchecks) is a watchdog for
# your cron jobs. It's a web server that listens for pings from your cron jobs,
# plus a web interface.

source ./.env
docker run -d \
  --name=healthchecks \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e SITE_ROOT=<SITE_ROOT> `# The site's top-level URL and the port it listens to if differrent than 80 or 443 (e.g., https://healthchecks.example.com:8000)` \
  -e SITE_NAME=<SITE_NAME> `# The site's name (e.g., "Example Corp HealthChecks")` \
  -e DEFAULT_FROM_EMAIL=<DEFAULT_FROM_EMAIL> `# From email for alerts` \
  -e EMAIL_HOST=<EMAIL_HOST> `# SMTP host` \
  -e EMAIL_PORT=<EMAIL_PORT> `# SMTP port` \
  -e EMAIL_HOST_USER=<EMAIL_HOST_USER> `# SMTP user` \
  -e EMAIL_HOST_PASSWORD=<EMAIL_HOST_PASSWORD> `# SMTP password` \
  -e EMAIL_USE_TLS=<True or False> `# Use TLS for SMTP (`True` or `False`)` \
  -e SUPERUSER_EMAIL=<SUPERUSER_EMAIL> `# Superuser email` \
  -e SUPERUSER_PASSWORD=<SUPERUSER_PASSWORD> `# Superuser password` \
  -e REGENERATE_SETTINGS=True/False `# optional` `# Defaults to False. Set to true to always override the `local_settings.py` file with values from environment variables. Do not set to True if you have made manual modifications to this file.` \
  -e SITE_LOGO_URL=<SITE_LOGO_URL> `# optional` `# Custom site logo URL` \
  -e ALLOWED_HOSTS=<ALLOWED_HOSTS> `# optional` `# array of valid hostnames for the server `["test.com","test2.com"]` (default: `["*"]`)` \
  -e SECRET_KEY=<SECRET_KEY> `# optional` `# A secret key used for cryptographic signing. docker-healthchecks will generate a secure value if one does not exist` \
  -e APPRISE_ENABLED=True/False `# optional` `# Defaults to False. A boolean that turns on/off the Apprise integration (https://github.com/caronc/apprise)` \
  -p 8000:8000 `# will map the container's port 8000 to port 8000 on the host` \
  -v ${BASEDIR:-/volume1/docker}/healthchecks/config:/config `# database and healthchecks config directory volume mapping` \
  --restart unless-stopped \
  ghcr.io/linuxserver/healthchecks
