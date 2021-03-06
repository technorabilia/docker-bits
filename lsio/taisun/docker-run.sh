# [Taisun](https://www.taisun.io/) is an application for a Docker enabled device
# with an emphasis on providing a web based interface for managing a single
# server. Taisun allows you to: - Deploy and manage web based virtual desktops.
# - Deploy Taisun specific stacks of applications - Browse available images on
# popular Docker repositories - Import a Docker project from any git repository
# and start developing on your choice of web based IDE or full Linux desktop -
# Spinup a developer container based on popular frameworks and work from a web
# based IDE - Single click remote server access to Taisun and your Docker
# applications

source ./.env
docker run -d \
  --name=taisun \
  -p 3000:3000 `# Taisun WebUI.` \
  -v /var/run/docker.sock:/var/run/docker.sock `# Docker Socket on the system` \
  --restart unless-stopped \
  ghcr.io/linuxserver/taisun
