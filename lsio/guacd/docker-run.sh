# [Guacd](https://guacamole.apache.org/) - Apache Guacamole is a clientless
# remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH.
# This container is only the backend server component needed to use The official
# or 3rd party HTML5 frontends.

source ./.env
docker run -d \
  --name=guacd \
  -p 4822:4822 `# Port Guacamole server listens on` \
  --restart unless-stopped \
  ghcr.io/linuxserver/guacd
