ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/paperless-ngx/config
mkdir -p ${BASEDIR:-/volume1/docker}/paperless-ngx/data
