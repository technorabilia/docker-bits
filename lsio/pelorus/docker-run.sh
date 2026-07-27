# [Pelorus](https://github.com/linuxserver/pelorus) is an AI navigator for
# Selkies-powered Linux desktops. Pelorus runs a FastAPI server that gives an
# LLM agent (Ollama, OpenAI-compatible, or Gemini) control over mouse, keyboard,
# screenshot, and window management via the [Pixelflux computer-use
# backend](https://github.com/linuxserver/pixelflux#computer-use-interface-
# wayland), a Linux accessibility tree (AT-SPI), and optional KWin D-Bus
# integration.

. ./.env
docker run -d \
  --name=pelorus \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3001:3001 `# Pelorus split plane GUI HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/pelorus/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/pelorus:latest
