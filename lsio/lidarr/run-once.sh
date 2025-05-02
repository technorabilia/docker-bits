ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/lidarr/config
mkdir -p ${BASEDIR:-/volume1/docker}/lidarr/music `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/lidarr/downloads `# [OPTIONAL]`
