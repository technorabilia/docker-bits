ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/flexget/config
mkdir -p ${BASEDIR:-/srv/lsio}/flexget/data `# [OPTIONAL]`
