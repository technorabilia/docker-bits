# [Piper](https://github.com/rhasspy/piper/) is a fast, local neural text to
# speech system that sounds great and is optimized for the Raspberry Pi 4. This
# container provides a Wyoming protocol server for Piper.

. ./.env
docker run -d \
  --name=piper \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PIPER_VOICE=en_US-lessac-medium `# The [Piper voice](https://huggingface.co/rhasspy/piper-voices/tree/main) to use, in the format `<language>-<name>-<quality>`` \
  -e LOCAL_ONLY= `# If set to `true`, or any other value, the container will not attempt to download models from HuggingFace and will only use locally-provided models. [OPTIONAL]` \
  -e PIPER_LENGTH=1.0 `# Voice speaking rate, 1.0 is default with < 1.0 being faster and > 1.0 being slower. [OPTIONAL]` \
  -e PIPER_NOISE=0.667 `# Controls the variability of the voice by adding noise. Values above 1 will start to degrade audio. [OPTIONAL]` \
  -e PIPER_NOISEW=0.333 `# Controls the variability of speaking cadence. Values above 1 produce extreme stutters and pauses. [OPTIONAL]` \
  -e PIPER_SPEAKER=0 `# Speaker number to use if the voice supports multiple speakers. [OPTIONAL]` \
  -e STREAMING= `# Setting to `true`, or any other value, will enable support for streaming audio on sentence boundaries. [OPTIONAL]` \
  -p 10200:10200 `# Wyoming connection port.` \
  -v ${BASEDIR:-/srv/lsio}/piper/config:/config `# Local path for piper config files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/piper:latest
