# [DOGWALK](https://studio.blender.org/projects/dogwalk/) is Blender Studio's
# long awaited second game project, focused on creating a bite-sized interactive
# storytelling playground. Play as a big adorable dog and explore the winter
# woods with a little kid.

. ./.env
docker run -d \
  --name=dogwalk \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP DOGWALK desktop gui, must be proxied.` \
  -p 3001:3001 `# HTTPS DOGWALK desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/dogwalk/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/dogwalk:latest
