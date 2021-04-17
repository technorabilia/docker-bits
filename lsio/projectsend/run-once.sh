ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/projectsend/config
mkdir -p ${BASEDIR:-/volume1/docker}/projectsend/data
