ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/pylon/config
mkdir -p ${BASEDIR:-/srv/lsio}/pylon/code `# [OPTIONAL]`
