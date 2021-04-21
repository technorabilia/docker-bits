# [Nzbhydra2](https://github.com/theotherp/nzbhydra2) is a meta search
# application for NZB indexers, the 'spiritual successor' to NZBmegasearcH, and
# an evolution of the original application
# [NZBHydra](https://github.com/theotherp/nzbhydra). It provides easy access to
# a number of raw and newznab based indexers. The application NZBHydra 2 is
# replacing NZBHydra 1 and supports migrating from V1. Be wary that there may be
# some compatibility issues for those migrating from V1 to V2, so ensure you
# back up your old configuration before moving over to the new version.
# **NOTE:** The last version that supports migration is
# `linuxserver/nzbhydra2:v2.10.2-ls49`

source ./.env
docker run -d \
  --name=nzbhydra2 \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 5076:5076 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/nzbhydra2/config:/config `# Where nzbhydra2 should store config files.` \
  -v ${BASEDIR:-/volume1/docker}/nzbhydra2/downloads:/downloads `# NZB download folder.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/nzbhydra2
