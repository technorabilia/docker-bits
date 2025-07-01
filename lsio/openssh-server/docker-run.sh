# [Openssh-server](https://www.openssh.com/) is a sandboxed environment that
# allows ssh access without giving keys to the entire server. Giving ssh access
# via private key often means giving full access to the server. This container
# creates a limited and sandboxed environment that others can ssh into. The
# users only have access to the folders mapped and the processes running inside
# this container.

. ./.env
docker run -d \
  --name=openssh-server \
    --hostname={{ project_name }} `# Optionally the hostname can be defined. [OPTIONAL]` \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PUBLIC_KEY=yourpublickey `# Optional ssh public key, which will automatically be added to authorized_keys. [OPTIONAL]` \
  -e PUBLIC_KEY_FILE=/path/to/file `# Optionally specify a file containing the public key (works with docker secrets). [OPTIONAL]` \
  -e PUBLIC_KEY_DIR=/path/to/directory/containing/_only_/pubkeys `# Optionally specify a directory containing the public keys (works with docker secrets). [OPTIONAL]` \
  -e PUBLIC_KEY_URL=https://github.com/username.keys `# Optionally specify a URL containing the public key. [OPTIONAL]` \
  -e SUDO_ACCESS=false `# Set to `true` to allow `linuxserver.io`, the ssh user, sudo access. Without `USER_PASSWORD` set, this will allow passwordless sudo access. [OPTIONAL]` \
  -e PASSWORD_ACCESS=false `# Set to `true` to allow user/password ssh access. You will want to set `USER_PASSWORD` or `USER_PASSWORD_FILE` as well. [OPTIONAL]` \
  -e USER_PASSWORD=password `# Optionally set a sudo password for `linuxserver.io`, the ssh user. If this or `USER_PASSWORD_FILE` are not set but `SUDO_ACCESS` is set to true, the user will have passwordless sudo access. [OPTIONAL]` \
  -e USER_PASSWORD_FILE=/path/to/file `# Optionally specify a file that contains the password. This setting supersedes the `USER_PASSWORD` option (works with docker secrets). [OPTIONAL]` \
  -e USER_NAME=linuxserver.io `# Optionally specify a user name (Default:`linuxserver.io`) [OPTIONAL]` \
  -e LOG_STDOUT= `# Set to `true` to log to stdout instead of file. [OPTIONAL]` \
  -p 2222:2222 `# ssh port` \
  -v ${BASEDIR:-/srv/lsio}/openssh-server/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/openssh-server:latest
