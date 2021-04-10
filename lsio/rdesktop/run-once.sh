ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/rdesktop/var/run/docker.sock `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/rdesktop/config `#optional`
