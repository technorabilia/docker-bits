# SWAG - Secure Web Application Gateway (formerly known as letsencrypt, no
# relation to Let's Encrypt™) sets up an Nginx webserver and reverse proxy with
# php support and a built-in certbot client that automates free SSL server
# certificate generation and renewal processes (Let's Encrypt and ZeroSSL). It
# also contains fail2ban for intrusion prevention.

. ./.env
docker run -d \
  --name=swag \
  --cap-add=NET_ADMIN \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e URL=example.com `# Top url you have control over (e.g. `example.com` if you own it, or `customsubdomain.example.com` if dynamic dns).` \
  -e VALIDATION=http `# Certbot validation method to use, options are `http` or `dns` (`dns` method also requires `DNSPLUGIN` variable set).` \
  -e SUBDOMAINS=www, `# optional` `# Subdomains you'd like the cert to cover (comma separated, no spaces) ie. `www,ftp,cloud`. For a wildcard cert, set this *exactly* to `wildcard` (wildcard cert is available via `dns` validation only)` \
  -e CERTPROVIDER= `# optional` `# Optionally define the cert provider. Set to `zerossl` for ZeroSSL certs (requires existing [ZeroSSL account](https://app.zerossl.com/signup) and the e-mail address entered in `EMAIL` env var). Otherwise defaults to Let's Encrypt.` \
  -e DNSPLUGIN=cloudflare `# optional` `# Required if `VALIDATION` is set to `dns`. Options are `acmedns`, `aliyun`, `azure`, `bunny`, `cloudflare`, `cpanel`, `desec`, `digitalocean`, `directadmin`, `dnsimple`, `dnsmadeeasy`, `dnspod`, `do`, `domeneshop`, `dreamhost`, `duckdns`, `dynu`, `freedns`, `gandi`, `gehirn`, `glesys`, `godaddy`, `google`, `he`, `hetzner`, `infomaniak`, `inwx`, `ionos`, `linode`, `loopia`, `luadns`, `namecheap`, `netcup`, `njalla`, `nsone`, `ovh`, `porkbun`, `rfc2136`, `route53`, `sakuracloud`, `standalone`, `transip`, and `vultr`. Also need to enter the credentials into the corresponding ini (or json for some plugins) file under `/config/dns-conf`.` \
  -e PROPAGATION= `# optional` `# Optionally override (in seconds) the default propagation time for the dns plugins.` \
  -e EMAIL= `# optional` `# Optional e-mail address used for cert expiration notifications (Required for ZeroSSL).` \
  -e ONLY_SUBDOMAINS=false `# optional` `# If you wish to get certs only for certain subdomains, but not the main domain (main domain may be hosted on another machine and cannot be validated), set this to `true`` \
  -e EXTRA_DOMAINS= `# optional` `# Additional fully qualified domain names (comma separated, no spaces) ie. `example.net,subdomain.example.net,*.example.org`` \
  -e STAGING=false `# optional` `# Set to `true` to retrieve certs in staging mode. Rate limits will be much higher, but the resulting cert will not pass the browser's security test. Only to be used for testing purposes.` \
  -e DISABLE_F2B= `# optional` `# Set to `true` to disable the Fail2ban service in the container, if you're already running it elsewhere or using a different IPS.` \
  -e SWAG_AUTORELOAD= `# optional` `# Set to `true` to enable automatic reloading of confs on change without stopping/restarting nginx. Your filesystem must support inotify. This functionality was previously offered [via mod](https://github.com/linuxserver/docker-mods/tree/swag-auto-reload).` \
  -e SWAG_AUTORELOAD_WATCHLIST= `# optional` `# A [pipe](https://en.wikipedia.org/wiki/Vertical_bar)-separated list of additional folders for auto reload to watch in addition to `/config/nginx`` \
  -p 443:443 `# HTTPS port` \
  -p 80:80 `# optional` `# HTTP port (required for HTTP validation and HTTP -> HTTPS redirect)` \
  -v ${BASEDIR:-/volume1/docker}/swag/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/swag
