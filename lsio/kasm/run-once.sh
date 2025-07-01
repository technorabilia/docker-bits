ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/kasm/opt
mkdir -p ${BASEDIR:-/srv/lsio}/kasm/profiles `# [OPTIONAL]`
