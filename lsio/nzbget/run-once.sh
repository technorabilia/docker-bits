ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/nzbget/config
mkdir -p ${BASEDIR:-/srv/lsio}/nzbget/downloads `# [OPTIONAL]`
