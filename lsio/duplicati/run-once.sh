ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/duplicati/config
mkdir -p ${BASEDIR:-/srv/lsio}/duplicati/backups
mkdir -p ${BASEDIR:-/srv/lsio}/duplicati/source
