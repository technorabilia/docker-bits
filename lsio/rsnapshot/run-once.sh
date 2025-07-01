ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/rsnapshot/config
mkdir -p ${BASEDIR:-/srv/lsio}/rsnapshot/.snapshots `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/srv/lsio}/rsnapshot/data `# [OPTIONAL]`
