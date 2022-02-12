# [Openvscode-server](https://github.com/gitpod-io/openvscode-server) provides a
# version of VS Code that runs a server on a remote machine and allows access
# through a modern web browser.

source ./.env
docker run -d \
  --name=openvscode-server \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CONNECTION_TOKEN= `# optional` `# Optional security token for accessing the Web UI (ie. `supersecrettoken`).` \
  -e CONNECTION_SECRET= `# optional` `# Optional path to a file inside the container that contains the security token for accessing the Web UI (ie. `/path/to/file`). Overrides `CONNECTION_TOKEN`.` \
  -e SUDO_PASSWORD=password `# optional` `# If this optional variable is set, user will have sudo access in the openvscode-server terminal with the specified password.` \
  -e SUDO_PASSWORD_HASH= `# optional` `# Optionally set sudo password via hash (takes priority over `SUDO_PASSWORD` var). Format is `$type$salt$hashed`.` \
  -p 3000:3000 `# Web UI port.` \
  -v ${BASEDIR:-/volume1/docker}/openvscode-server/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/openvscode-server
