ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/webgrabplus/config
mkdir -p ${BASEDIR:-/volume1/docker}/webgrabplus/data
