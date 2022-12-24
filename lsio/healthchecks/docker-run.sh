# [Healthchecks](https://github.com/healthchecks/healthchecks) is a watchdog for
# your cron jobs. It's a web server that listens for pings from your cron jobs,
# plus a web interface.

source ./.env
docker run -d \
  --name=healthchecks \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e SITE_ROOT= `# The site's top-level URL and the port it listens to if differrent than 80 or 443 (e.g., https://healthchecks.example.com:8000)` \
  -e SITE_NAME= `# The site's name (e.g., "Example Corp HealthChecks")` \
  -e DEFAULT_FROM_EMAIL= `# From email for alerts` \
  -e EMAIL_HOST= `# SMTP host` \
  -e EMAIL_PORT= `# SMTP port` \
  -e EMAIL_HOST_USER= `# SMTP user` \
  -e EMAIL_HOST_PASSWORD= `# SMTP password` \
  -e EMAIL_USE_TLS= `# Use TLS for SMTP (`True` or `False`)` \
  -e SUPERUSER_EMAIL= `# Superuser email` \
  -e SUPERUSER_PASSWORD= `# Superuser password` \
  -e REGENERATE_SETTINGS= `# optional` `# Defaults to False. Set to True to always override the `local_settings.py` file with values from environment variables. Do not set to True if you have made manual modifications to this file.` \
  -e ALLOWED_HOSTS= `# optional` `# Array of valid hostnames for the server `["test.com","test2.com"]` (default: `["*"]`)` \
  -e APPRISE_ENABLED= `# optional` `# Defaults to False. A boolean that turns on/off the Apprise integration (https://github.com/caronc/apprise)` \
  -e DEBUG= `# optional` `# Defaults to True. Debug mode relaxes CSRF protections and increases logging verbosity but should be disabled for production instances as it will impact performance and security.` \
  -e INTEGRATIONS_ALLOW_PRIVATE_IPS= `# optional` `# Defaults to False. Set to True to allow integrations to connect to private IP addresses.` \
  -e PING_EMAIL_DOMAIN= `# optional` `# The domain to use for generating ping email addresses.` \
  -e SECRET_KEY= `# optional` `# A secret key used for cryptographic signing. Will generate a secure value if one is not supplied` \
  -e SITE_LOGO_URL= `# optional` `# Full URL to custom site logo` \
  -p 8000:8000 `# Healthchecks Web UI` \
  -p 2525:2525 `# optional` `# Port for inbound SMTP pings` \
  -v ${BASEDIR:-/volume1/docker}/healthchecks/config:/config `# Database and healthchecks config directory` \
  --restart unless-stopped \
  ghcr.io/linuxserver/healthchecks
