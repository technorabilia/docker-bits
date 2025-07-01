ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/projectsend/config
mkdir -p ${BASEDIR:-/srv/lsio}/projectsend/data
