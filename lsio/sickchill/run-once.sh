ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/sickchill/config
mkdir -p ${BASEDIR:-/srv/lsio}/sickchill/downloads `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/srv/lsio}/sickchill/tv `# [OPTIONAL]`
