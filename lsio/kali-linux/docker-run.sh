# [Kali-linux](https://github.com/linuxserver/docker-kali-linux) - is an
# Advanced Penetration Testing Linux distribution used for Penetration Testing,
# Ethical Hacking and network security assessments. KALI LINUX ™ is a trademark
# of OffSec.

. ./.env
docker run -d \
  --name=kali-linux \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Web Desktop GUI` \
  -p 3001:3001 `# Web Desktop GUI HTTPS` \
  -v ${BASEDIR:-/srv/lsio}/kali-linux/config:/config `# abc users home directory` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/kali-linux:latest
