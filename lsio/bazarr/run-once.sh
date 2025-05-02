ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/bazarr/config
mkdir -p ${BASEDIR:-/volume1/docker}/bazarr/movies `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/bazarr/tv `# [OPTIONAL]`
