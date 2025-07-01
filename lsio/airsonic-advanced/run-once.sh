ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/airsonic-advanced/config
mkdir -p ${BASEDIR:-/srv/lsio}/airsonic-advanced/music
mkdir -p ${BASEDIR:-/srv/lsio}/airsonic-advanced/playlists
mkdir -p ${BASEDIR:-/srv/lsio}/airsonic-advanced/podcasts
mkdir -p ${BASEDIR:-/srv/lsio}/airsonic-advanced/media `# [OPTIONAL]`
