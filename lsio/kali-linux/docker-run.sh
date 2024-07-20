# [Kali-linux](https://github.com/linuxserver/docker-kali-linux) - is an
# Advanced Penetration Testing Linux distribution used for Penetration Testing,
# Ethical Hacking and network security assessments. KALI LINUX ™ is a trademark
# of OffSec.

. ./.env
docker run -d \
  --name=kali-linux \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder to use with reverse proxies, IE `/subfolder/`` \
  -e TITLE=Kali Linux `# optional` `# String which will be used as page/tab title in the web browser.` \
  -p 3000:3000 `# Web Desktop GUI` \
  -p 3001:3001 `# Web Desktop GUI HTTPS` \
  -v ${BASEDIR:-/volume1/docker}/kali-linux/config:/config `# abc users home directory` \
  -v /var/run/docker.sock:/var/run/docker.sock `# optional` `# Docker Socket on the system, if you want to use Docker in the container` \
  --device /dev/dri:/dev/dri `# optional` `# Add this for GL support (Linux hosts only)` \
  --shm-size="1gb" `# optional` \
  --restart unless-stopped \
  ghcr.io/linuxserver/kali-linux
