ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/rdesktop/config
mkdir -p ${BASEDIR:-/srv/lsio}/rdesktop/config `# [OPTIONAL]`
