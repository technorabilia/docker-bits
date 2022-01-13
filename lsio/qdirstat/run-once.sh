ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/qdirstat/config
mkdir -p ${BASEDIR:-/volume1/docker}/qdirstat/data
