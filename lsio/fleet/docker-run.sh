# Fleet provides an online web interface which displays a set of maintained
# images from one or more owned repositories.

source ./.env
docker run -d \
  --name=fleet \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e fleet_admin_authentication_type=DATABASE `# A switch to define how Fleet manages user logins. If set to DATABASE, see the related optional params. Can be set to either DATABASE or PROPERTIES.` \
  -e fleet_database_url=jdbc:mariadb://<url>:3306/fleet `# The full JDBC connection string to the Fleet database` \
  -e fleet_database_username=fleet_user `# The username with the relevant GRANT permissions for the database` \
  -e fleet_database_password=dbuserpassword `# The database user's password.` \
  -e fleet_admin_secret=randomstring `# optional` `# A string used as part of the password key derivation process.` \
  -p 8080:8080 `# Http port` \
  -v ${BASEDIR:-/volume1/docker}/fleet/config:/config `# The primary config file and rolling log files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/fleet
