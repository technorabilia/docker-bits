ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/webgrabplus/config
mkdir -p ${BASEDIR:-/srv/lsio}/webgrabplus/data
