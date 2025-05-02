# [Ldap-auth](https://github.com/nginxinc/nginx-ldap-auth) software is for
# authenticating users who request protected resources from servers proxied by
# nginx. It includes a daemon (ldap-auth) that communicates with an
# authentication server, and a webserver daemon that generates an authentication
# cookie based on the user’s credentials. The daemons are written in Python for
# use with a Lightweight Directory Access Protocol (LDAP) authentication server
# (OpenLDAP or Microsoft Windows Active Directory 2003 and 2012).

. ./.env
docker run -d \
  --name=ldap-auth \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e FERNETKEY= `# Optionally define a custom valid fernet key (only needed if container is frequently recreated, or if using multi-node setups, invalidating previous authentications) [OPTIONAL]` \
  -e CERTFILE= `# Optionally point this to a certificate file to enable HTTP over SSL (HTTPS) for the ldap auth daemon [OPTIONAL]` \
  -e KEYFILE= `# Optionally point this to the private key file, matching the certificate file referred to in CERTFILE [OPTIONAL]` \
  -p 8888:8888 `# the port for ldap auth daemon` \
  -p 9000:9000 `# the port for ldap login page` \
  -v ${BASEDIR:-/volume1/docker}/ldap-auth/config:/config `# Configuration files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/ldap-auth:latest
