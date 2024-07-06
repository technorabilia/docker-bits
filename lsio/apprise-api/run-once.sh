ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/apprise-api/config
mkdir -p ${BASEDIR:-/volume1/docker}/apprise-api/attachments `#optional`
