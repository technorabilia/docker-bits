ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/sabnzbd/config
mkdir -p ${BASEDIR:-/volume1/docker}/sabnzbd/incomplete-downloads `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/sabnzbd/downloads `# [OPTIONAL]`
