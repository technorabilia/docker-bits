ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/doublecommander/config
mkdir -p ${BASEDIR:-/srv/lsio}/doublecommander/data
