ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/netbootxyz/config
mkdir -p ${BASEDIR:-/volume1/docker}/netbootxyz/assets `#optional`
