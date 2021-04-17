ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/chevereto/config
mkdir -p ${BASEDIR:-/volume1/docker}/chevereto/data
