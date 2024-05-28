ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/rdesktop/config
mkdir -p ${BASEDIR:-/volume1/docker}/rdesktop/config `#optional`
