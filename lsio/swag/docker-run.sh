# SWAG - Secure Web Application Gateway (formerly known as letsencrypt, no
# relation to Let's Encrypt™) sets up an Nginx webserver and reverse proxy with
# php support and a built-in certbot client that automates free SSL server
# certificate generation and renewal processes (Let's Encrypt and ZeroSSL). It
# also contains fail2ban for intrusion prevention.

. ./.env
docker run -d \
  --name=swag \
  --cap-add=NET_ADMIN \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e URL=example.com `# Top url you have control over (e.g. `example.com` if you own it, or `customsubdomain.example.com` if dynamic dns).` \
  -e VALIDATION=http `# Certbot validation method to use, options are `http` or `dns` (`dns` method also requires `DNSPLUGIN` variable set).` \
  -e SUBDOMAINS=www, `# Subdomains you'd like the cert to cover (comma separated, no spaces) ie. `www,ftp,cloud`. For a wildcard cert, set this *exactly* to `wildcard` (wildcard cert is available via `dns` validation only) [OPTIONAL]` \
  -e CERTPROVIDER= `# Optionally define the cert provider. Set to `zerossl` for ZeroSSL certs (requires existing [ZeroSSL account](https://app.zerossl.com/signup) and the e-mail address entered in `EMAIL` env var). Otherwise defaults to Let's Encrypt. [OPTIONAL]` \
  -e DNSPLUGIN=cloudflare `# Required if `VALIDATION` is set to `dns`. Options are `acmedns`, `aliyun`, `azure`, `bunny`, `cloudflare`, `cpanel`, `desec`, `digitalocean`, `directadmin`, `dnsimple`, `dnsmadeeasy`, `dnspod`, `do`, `domeneshop`, `dreamhost`, `duckdns`, `dynu`, `freedns`, `gandi`, `gehirn`, `glesys`, `godaddy`, `google`, `he`, `hetzner`, `infomaniak`, `inwx`, `ionos`, `linode`, `loopia`, `luadns`, `namecheap`, `netcup`, `njalla`, `nsone`, `ovh`, `porkbun`, `rfc2136`, `route53`, `sakuracloud`, `standalone`, `transip`, and `vultr`. Also need to enter the credentials into the corresponding ini (or json for some plugins) file under `/config/dns-conf`. [OPTIONAL]` \
  -e PROPAGATION= `# Optionally override (in seconds) the default propagation time for the dns plugins. [OPTIONAL]` \
  -e EMAIL= `# Optional e-mail address used for cert expiration notifications (Required for ZeroSSL). [OPTIONAL]` \
  -e ONLY_SUBDOMAINS=false `# If you wish to get certs only for certain subdomains, but not the main domain (main domain may be hosted on another machine and cannot be validated), set this to `true` [OPTIONAL]` \
  -e EXTRA_DOMAINS= `# Additional fully qualified domain names (comma separated, no spaces) ie. `example.net,subdomain.example.net,*.example.org` [OPTIONAL]` \
  -e STAGING=false `# Set to `true` to retrieve certs in staging mode. Rate limits will be much higher, but the resulting cert will not pass the browser's security test. Only to be used for testing purposes. [OPTIONAL]` \
  -e DISABLE_F2B= `# Set to `true` to disable the Fail2ban service in the container, if you're already running it elsewhere or using a different IPS. [OPTIONAL]` \
  -e SWAG_AUTORELOAD= `# Set to `true` to enable automatic reloading of confs on change without stopping/restarting nginx. Your filesystem must support inotify. This functionality was previously offered [via mod](https://github.com/linuxserver/docker-mods/tree/swag-auto-reload). [OPTIONAL]` \
  -e SWAG_AUTORELOAD_WATCHLIST= `# A [pipe](https://en.wikipedia.org/wiki/Vertical_bar)-separated list of additional folders for auto reload to watch in addition to `/config/nginx` [OPTIONAL]` \
  -p 443:443 `# HTTPS port` \
  -p 80:80 `# HTTP port (required for HTTP validation and HTTP -> HTTPS redirect) [OPTIONAL]` \
  -p 443/udp:443/udp `# QUIC (HTTP/3) port. Must be enabled in the default and proxy confs. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/swag/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/swag:latest
