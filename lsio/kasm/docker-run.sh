# [Kasm](https://www.kasmweb.com/?utm_campaign=LinuxServer&utm_source=listing)
# Workspaces is a docker container streaming platform for delivering browser-
# based access to desktops, applications, and web services. Kasm uses devops-
# enabled Containerized Desktop Infrastructure (CDI) to create on-demand,
# disposable, docker containers that are accessible via web browser. Example
# use-cases include Remote Browser Isolation (RBI), Data Loss Prevention (DLP),
# Desktop as a Service (DaaS), Secure Remote Access Services (RAS), and Open
# Source Intelligence (OSINT) collections. The rendering of the graphical-based
# containers is powered by the open-source project
# [KasmVNC](https://www.kasmweb.com/kasmvnc.html?utm_campaign=LinuxServer&utm_source=kasmvnc).

. ./.env
docker run -d \
  --name=kasm \
  --privileged \
  -e KASM_PORT=443 `# Specify the port you bind to the outside for Kasm Workspaces.` \
  -e DOCKER_HUB_USERNAME=USER `# optional` `# Optionally specify a DockerHub Username to pull private images.` \
  -e DOCKER_HUB_PASSWORD=PASS `# optional` `# Optionally specify a DockerHub password to pull private images.` \
  -e DOCKER_MTU=1500 `# optional` `# Optionally specify the mtu options passed to dockerd.` \
  -p 3000:3000 `# Kasm Installation wizard. (https)` \
  -p 443:443 `# Kasm Workspaces interface. (https)` \
  -v ${BASEDIR:-/volume1/docker}/kasm/opt:/opt `# Docker and installation storage.` \
  -v ${BASEDIR:-/volume1/docker}/kasm/profiles:/profiles `# optional` `# Optionally specify a path for persistent profile storage.` \
  -v /dev/input:/dev/input `# optional` `# Optional for gamepad support.` \
  -v /run/udev/data:/run/udev/data `# optional` `# Optional for gamepad support.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/kasm
