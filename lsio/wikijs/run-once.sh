ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/wikijs/config
mkdir -p ${BASEDIR:-/srv/lsio}/wikijs/data
