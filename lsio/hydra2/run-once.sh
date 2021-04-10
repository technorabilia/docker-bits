ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/hydra2/config
mkdir -p ${BASEDIR:-/volume1/docker}/hydra2/downloads
