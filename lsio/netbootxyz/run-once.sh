ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/netbootxyz/config
mkdir -p ${BASEDIR:-/volume1/docker}/netbootxyz/assets `#optional`
