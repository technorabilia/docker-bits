ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/manyfold/config
mkdir -p ${BASEDIR:-/srv/lsio}/manyfold/libraries `# [OPTIONAL]`
