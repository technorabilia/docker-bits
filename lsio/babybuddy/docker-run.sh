# [Babybuddy](https://github.com/babybuddy/babybuddy) is a buddy for babies!
# Helps caregivers track sleep, feedings, diaper changes, tummy time and more to
# learn about and predict baby's needs without (as much) guess work.

source ./.env
docker run -d \
  --name=babybuddy \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CSRF_TRUSTED_ORIGINS=http://127.0.0.1:8000,https://babybuddy.domain.com `# Add any address you'd like to access babybuddy at (comma separated, no spaces)` \
  -p 8000:8000 `# the port for the web ui` \
  -v ${BASEDIR:-/volume1/docker}/babybuddy/config:/config `# Contains all relevant configuration and data.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/babybuddy
