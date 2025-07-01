ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/kavita/config
mkdir -p ${BASEDIR:-/srv/lsio}/kavita/data `# [OPTIONAL]`
