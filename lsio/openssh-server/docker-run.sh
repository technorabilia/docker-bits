# [Openssh-server](https://www.openssh.com/) is a sandboxed environment that
# allows ssh access without giving keys to the entire server. Giving ssh access
# via private key often means giving full access to the server. This container
# creates a limited and sandboxed environment that others can ssh into. The
# users only have access to the folders mapped and the processes running inside
# this container.

. ./.env
docker run -d \
  --name=openssh-server \
    --hostname={{ project_name }} `# optional` `# Optionally the hostname can be defined.` \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PUBLIC_KEY=yourpublickey `# optional` `# Optional ssh public key, which will automatically be added to authorized_keys.` \
  -e PUBLIC_KEY_FILE=/path/to/file `# optional` `# Optionally specify a file containing the public key (works with docker secrets).` \
  -e PUBLIC_KEY_DIR=/path/to/directory/containing/_only_/pubkeys `# optional` `# Optionally specify a directory containing the public keys (works with docker secrets).` \
  -e PUBLIC_KEY_URL=https://github.com/username.keys `# optional` `# Optionally specify a URL containing the public key.` \
  -e SUDO_ACCESS=false `# optional` `# Set to `true` to allow `linuxserver.io`, the ssh user, sudo access. Without `USER_PASSWORD` set, this will allow passwordless sudo access.` \
  -e PASSWORD_ACCESS=false `# optional` `# Set to `true` to allow user/password ssh access. You will want to set `USER_PASSWORD` or `USER_PASSWORD_FILE` as well.` \
  -e USER_PASSWORD=password `# optional` `# Optionally set a sudo password for `linuxserver.io`, the ssh user. If this or `USER_PASSWORD_FILE` are not set but `SUDO_ACCESS` is set to true, the user will have passwordless sudo access.` \
  -e USER_PASSWORD_FILE=/path/to/file `# optional` `# Optionally specify a file that contains the password. This setting supersedes the `USER_PASSWORD` option (works with docker secrets).` \
  -e USER_NAME=linuxserver.io `# optional` `# Optionally specify a user name (Default:`linuxserver.io`)` \
  -e LOG_STDOUT= `# optional` `# Set to `true` to log to stdout instead of file.` \
  -p 2222:2222 `# ssh port` \
  -v ${BASEDIR:-/volume1/docker}/openssh-server/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/openssh-server
