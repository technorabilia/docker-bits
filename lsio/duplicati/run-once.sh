ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/duplicati/config
mkdir -p ${BASEDIR:-/volume1/docker}/duplicati/backups
mkdir -p ${BASEDIR:-/volume1/docker}/duplicati/source
