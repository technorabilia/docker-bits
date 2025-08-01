# [Obsidian](https://obsidian.md) is a note-taking app that lets you create,
# link, and organize your notes on your device, with hundreds of plugins and
# themes to customize your workflow. You can also publish your notes online,
# access them offline, and sync them securely with end-to-end encryption.

. ./.env
docker run -d \
  --name=obsidian \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Obsidian desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Obsidian desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/obsidian/config:/config `# Users home directory in the container, stores program settings and files.` \
  --device /dev/dri:/dev/dri `# Add this for GL support (Linux hosts only) [OPTIONAL]` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/obsidian:latest
