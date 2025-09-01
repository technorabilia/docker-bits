# [Bambu Studio](https://bambulab.com/en/download/studio) is an open-source,
# cutting-edge, feature-rich slicing software. It contains project-based
# workflows, systematically optimized slicing algorithms, and an easy-to-use
# graphical interface, bringing users an incredibly smooth printing experience.

. ./.env
docker run -d \
  --name=bambustudio \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DARK_MODE=true `# Set this to true to enable dark mode for Bambu Studio. [OPTIONAL]` \
  -p 3000:3000 `# Bambu Studio desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Bambu Studio desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/bambustudio/config:/config `# Users home directory in the container, stores program settings and files.` \
  --shm-size="1gb" `# [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/bambustudio:latest
