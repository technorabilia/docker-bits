ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/nextcloud/config
mkdir -p ${BASEDIR:-/volume1/docker}/nextcloud/data
