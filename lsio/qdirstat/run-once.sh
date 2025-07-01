ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/qdirstat/config
mkdir -p ${BASEDIR:-/srv/lsio}/qdirstat/data
