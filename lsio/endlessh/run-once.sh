ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/endlessh/config
mkdir -p ${BASEDIR:-/volume1/docker}/endlessh/config `#optional`
