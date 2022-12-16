ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/kasm/opt
mkdir -p ${BASEDIR:-/volume1/docker}/kasm/profiles `#optional`
