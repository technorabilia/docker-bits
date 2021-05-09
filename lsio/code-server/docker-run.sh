# [Code-server](https://coder.com) is VS Code running on a remote server,
# accessible through the browser. - Code on your Chromebook, tablet, and laptop
# with a consistent dev environment. - If you have a Windows or Mac workstation,
# more easily develop for Linux. - Take advantage of large cloud servers to
# speed up tests, compilations, downloads, and more. - Preserve battery life
# when you're on the go. - All intensive computation runs on your server. -
# You're no longer running excess instances of Chrome.

source ./.env
docker run -d \
  --name=code-server \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e PASSWORD=password `# optional` `# Optional web gui password, if `PASSWORD` or `HASHED_PASSWORD` is not provided, there will be no auth.` \
  -e HASHED_PASSWORD= `# optional` `# Optional web gui password, overrides `PASSWORD`, instructions on how to create it is below.` \
  -e SUDO_PASSWORD=password `# optional` `# If this optional variable is set, user will have sudo access in the code-server terminal with the specified password.` \
  -e SUDO_PASSWORD_HASH= `# optional` `# Optionally set sudo password via hash (takes priority over `SUDO_PASSWORD` var). Format is `$type$salt$hashed`.` \
  -e PROXY_DOMAIN=code-server.my.domain `# optional` `# If this optional variable is set, this domain will be proxied for subdomain proxying. See [Documentation](https://github.com/cdr/code-server/blob/master/docs/FAQ.md#sub-domains)` \
  -p 8443:8443 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/code-server/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/code-server
