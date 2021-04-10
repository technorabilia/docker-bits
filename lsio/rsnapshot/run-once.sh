ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/rsnapshot/config
mkdir -p ${BASEDIR:-/volume1/docker}/rsnapshot/.snapshots `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/rsnapshot/data `#optional`
