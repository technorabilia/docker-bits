# [Babybuddy](https://github.com/babybuddy/babybuddy) is a buddy for babies!
# Helps caregivers track sleep, feedings, diaper changes, tummy time and more to
# learn about and predict baby's needs without (as much) guess work.

source ./.env
docker run -d \
  --name=babybuddy \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8000:8000 `# the port for the web ui` \
  -v ${BASEDIR:-/volume1/docker}/babybuddy/config:/config `# Contains all relevant configuration and data.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/babybuddy
