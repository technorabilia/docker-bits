ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/sabnzbd/config
mkdir -p ${BASEDIR:-/srv/lsio}/sabnzbd/incomplete-downloads `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/srv/lsio}/sabnzbd/downloads `# [OPTIONAL]`
