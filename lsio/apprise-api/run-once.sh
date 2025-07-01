ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/apprise-api/config
mkdir -p ${BASEDIR:-/srv/lsio}/apprise-api/attachments `# [OPTIONAL]`
