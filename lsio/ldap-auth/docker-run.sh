# [Ldap-auth](https://github.com/nginxinc/nginx-ldap-auth) software is for
# authenticating users who request protected resources from servers proxied by
# nginx. It includes a daemon (ldap-auth) that communicates with an
# authentication server, and a webserver daemon that generates an authentication
# cookie based on the user’s credentials. The daemons are written in Python for
# use with a Lightweight Directory Access Protocol (LDAP) authentication server
# (OpenLDAP or Microsoft Windows Active Directory 2003 and 2012).

source ./.env
docker run -d \
  --name=ldap-auth \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e FERNETKEY= `# optional` `# Optionally define a custom fernet key, has to be base64-encoded 32-byte (only needed if container is frequently recreated, or if using multi-node setups, invalidating previous authentications)` \
  -e CERTFILE= `# optional` `# Point this to a certificate file to enable HTTP over SSL (HTTPS) for the ldap auth daemon` \
  -e KEYFILE= `# optional` `# Point this to the private key file, matching the certificate file referred to in CERTFILE` \
  -p 8888:8888 `# the port for ldap auth daemon` \
  -p 9000:9000 `# the port for ldap login page` \
  --restart unless-stopped \
  ghcr.io/linuxserver/ldap-auth
