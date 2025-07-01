ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/diskover/config
mkdir -p ${BASEDIR:-/srv/lsio}/diskover/data
