ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/nzbhydra2/config
mkdir -p ${BASEDIR:-/srv/lsio}/nzbhydra2/downloads `# [OPTIONAL]`
