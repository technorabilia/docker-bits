# [BOINC]({{ project_url }}) is a platform for high-throughput computing on a
# large scale (thousands or millions of computers). It can be used for volunteer
# computing (using consumer devices) or grid computing (using organizational
# resources). It supports virtualized, parallel, and GPU-based applications.

source ./.env
docker run -d \
  --name=boinc \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e GUAC_USER=abc `# optional` `# Username for the BOINC desktop gui.` \
  -e GUAC_PASS=900150983cd24fb0d6963f7d28e17f72 `# optional` `# Password's md5 hash for the BOINC desktop gui.` \
  -p 8080:8080 `# Boinc desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/boinc/config:/config `# Where BOINC should store its database and config.` \
  --device /dev/dri:/dev/dri `# optional` `# Only needed if you want to use your Intel GPU (vaapi).` \
  --restart unless-stopped \
  ghcr.io/linuxserver/boinc
