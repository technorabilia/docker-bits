ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/syslog-ng/config
mkdir -p ${BASEDIR:-/volume1/docker}/syslog-ng/var/log `#optional`
