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
  -e SUBFOLDER=/ `# Specify a subfolder to use with reverse proxies, IE `/subfolder/` [OPTIONAL]` \
  -e TITLE=Kali Linux `# String which will be used as page/tab title in the web browser. [OPTIONAL]` \
  -p 3000:3000 `# Web Desktop GUI` \
  -p 3001:3001 `# Web Desktop GUI HTTPS` \
  -v ${BASEDIR:-/volume1/docker}/kali-linux/config:/config `# abc users home directory` \
  -v /var/run/docker.sock:/var/run/docker.sock `# Docker Socket on the system, if you want to use Docker in the container [OPTIONAL]` \
  --shm-size="1gb" `# [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/kali-linux:latest
