ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/bazarr/config
mkdir -p ${BASEDIR:-/srv/lsio}/bazarr/movies `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/srv/lsio}/bazarr/tv `# [OPTIONAL]`
