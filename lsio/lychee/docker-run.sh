# [Lychee](https://lycheeorg.github.io/) is a free photo-management tool, which
# runs on your server or web-space. Installing is a matter of seconds. Upload,
# manage and share photos like from a native application. Lychee comes with
# everything you need and all your photos are stored securely.

. ./.env
docker run -d \
  --name=lychee \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DB_CONNECTION= `# DB type, from `sqlite`, `mysql`, `pqsql`.` \
  -e DB_HOST= `# DB server hostname. For `mysql` and `pgsql` only.` \
  -e DB_PORT= `# DB server port. For `mysql` and `pgsql` only.` \
  -e DB_USERNAME= `# DB user. For `mysql` and `pgsql` only.` \
  -e DB_PASSWORD= `# DB password. For `mysql` and `pgsql` only.` \
  -e DB_DATABASE= `# Path to DB file for `sqlite`. DB name for `mysql` and `pgsql`.` \
  -e APP_NAME=Lychee `# The gallery name. [OPTIONAL]` \
  -e APP_URL= `# The URL you will use to access Lychee including protocol, and port where appropriate. [OPTIONAL]` \
  -e TRUSTED_PROXIES= `# Set to the IP or netmask covering your reverse proxy, if running behind one. Set to `*` to trust all IPs (**do not** use `*` if exposed to the internet`). [OPTIONAL]` \
  -p 80:80 `# http gui` \
  -v ${BASEDIR:-/srv/lsio}/lychee/config:/config `# Persistent config files.` \
  -v ${BASEDIR:-/srv/lsio}/lychee/pictures:/pictures `# Where lychee will store uploaded images.` \
  --restart unless-stopped \
  lscr.io/linuxserver/lychee:latest
