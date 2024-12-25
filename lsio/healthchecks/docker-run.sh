# [Healthchecks](https://github.com/healthchecks/healthchecks) is a watchdog for
# your cron jobs. It's a web server that listens for pings from your cron jobs,
# plus a web interface.

. ./.env
docker run -d \
  --name=healthchecks \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SITE_ROOT= `# The site's top-level URL and the port it listens to if different than 80 or 443 (e.g., https://healthchecks.example.com:8000).` \
  -e SITE_NAME= `# The site's name (e.g., "Example Corp HealthChecks").` \
  -e SUPERUSER_EMAIL= `# Superuser email.` \
  -e SUPERUSER_PASSWORD= `# Superuser password.` \
  -e ALLOWED_HOSTS= `# optional` `# A comma-separated list of valid hostnames for the server. Default is the domain portion of `SITE_ROOT`.` \
  -e APPRISE_ENABLED=False `# optional` `# Set to `True` to enable the Apprise integration (https://github.com/caronc/apprise).` \
  -e CSRF_TRUSTED_ORIGINS= `# optional` `# A [list](https://docs.python.org/3/tutorial/introduction.html#lists) of trusted origins for unsafe requests (e.g. POST). Defaults to the value of `SITE_ROOT`.` \
  -e DEBUG=True `# optional` `# Set to `False` to disable. Debug mode relaxes CSRF protections and increases logging verbosity but should be disabled for production instances as it will impact performance and security.` \
  -e DEFAULT_FROM_EMAIL= `# optional` `# From email for alerts.` \
  -e EMAIL_HOST= `# optional` `# SMTP host.` \
  -e EMAIL_PORT= `# optional` `# SMTP port.` \
  -e EMAIL_HOST_USER= `# optional` `# SMTP user.` \
  -e EMAIL_HOST_PASSWORD= `# optional` `# SMTP password.` \
  -e EMAIL_USE_TLS= `# optional` `# Use TLS for SMTP (`True` or `False`).` \
  -e INTEGRATIONS_ALLOW_PRIVATE_IPS= `# optional` `# Defaults to False. Set to True to allow integrations to connect to private IP addresses.` \
  -e PING_EMAIL_DOMAIN= `# optional` `# The domain to use for generating ping email addresses. Defaults to `localhost`.` \
  -e RP_ID= `# optional` `# If using webauthn for 2FA set this to match your Healthchecks domain. Webauthn will only work over https.` \
  -e SECRET_KEY= `# optional` `# A secret key used for cryptographic signing. Will generate a random value if one is not supplied and save it to `/config/local_settings.py`.` \
  -e SITE_LOGO_URL= `# optional` `# Full URL to custom site logo.` \
  -p 8000:8000 `# Healthchecks Web UI` \
  -p 2525:2525 `# optional` `# Port for inbound SMTP pings` \
  -v ${BASEDIR:-/volume1/docker}/healthchecks/config:/config `# Persistent config files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/healthchecks
