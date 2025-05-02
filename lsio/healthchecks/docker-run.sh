# [Healthchecks](https://github.com/healthchecks/healthchecks) is a watchdog for
# your cron jobs. It's a web server that listens for pings from your cron jobs,
# plus a web interface.

. ./.env
docker run -d \
  --name=healthchecks \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SITE_ROOT= `# The site's top-level URL and the port it listens to if different than 80 or 443 (e.g., https://healthchecks.example.com:8000).` \
  -e SITE_NAME= `# The site's name (e.g., "Example Corp HealthChecks").` \
  -e SUPERUSER_EMAIL= `# Superuser email.` \
  -e SUPERUSER_PASSWORD= `# Superuser password.` \
  -e ALLOWED_HOSTS= `# A comma-separated list of valid hostnames for the server. Default is the domain portion of `SITE_ROOT`. [OPTIONAL]` \
  -e APPRISE_ENABLED=False `# Set to `True` to enable the Apprise integration (https://github.com/caronc/apprise). [OPTIONAL]` \
  -e CSRF_TRUSTED_ORIGINS= `# A [list](https://docs.python.org/3/tutorial/introduction.html#lists) of trusted origins for unsafe requests (e.g. POST). Defaults to the value of `SITE_ROOT`. [OPTIONAL]` \
  -e DEBUG=True `# Set to `False` to disable. Debug mode relaxes CSRF protections and increases logging verbosity but should be disabled for production instances as it will impact performance and security. [OPTIONAL]` \
  -e DEFAULT_FROM_EMAIL= `# From email for alerts. [OPTIONAL]` \
  -e EMAIL_HOST= `# SMTP host. [OPTIONAL]` \
  -e EMAIL_PORT= `# SMTP port. [OPTIONAL]` \
  -e EMAIL_HOST_USER= `# SMTP user. [OPTIONAL]` \
  -e EMAIL_HOST_PASSWORD= `# SMTP password. [OPTIONAL]` \
  -e EMAIL_USE_TLS= `# Use TLS for SMTP (`True` or `False`). [OPTIONAL]` \
  -e INTEGRATIONS_ALLOW_PRIVATE_IPS= `# Defaults to False. Set to True to allow integrations to connect to private IP addresses. [OPTIONAL]` \
  -e PING_EMAIL_DOMAIN= `# The domain to use for generating ping email addresses. Defaults to `localhost`. [OPTIONAL]` \
  -e RP_ID= `# If using webauthn for 2FA set this to match your Healthchecks domain. Webauthn will only work over https. [OPTIONAL]` \
  -e SECRET_KEY= `# A secret key used for cryptographic signing. Will generate a random value if one is not supplied and save it to `/config/local_settings.py`. [OPTIONAL]` \
  -e SITE_LOGO_URL= `# Full URL to custom site logo. [OPTIONAL]` \
  -p 8000:8000 `# Healthchecks Web UI` \
  -p 2525:2525 `# Port for inbound SMTP pings [OPTIONAL]` \
  -v ${BASEDIR:-/volume1/docker}/healthchecks/config:/config `# Persistent config files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/healthchecks:latest
