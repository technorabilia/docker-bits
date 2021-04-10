ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/projectsend/config
mkdir -p ${BASEDIR:-/volume1/docker}/projectsend/data
