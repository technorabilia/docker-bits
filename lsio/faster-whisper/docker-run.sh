# [Faster-whisper](https://github.com/SYSTRAN/faster-whisper) is a
# reimplementation of OpenAI's Whisper model using CTranslate2, which is a fast
# inference engine for Transformer models. This container provides a Wyoming
# protocol server for faster-whisper.

. ./.env
docker run -d \
  --name=faster-whisper \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e WHISPER_MODEL=tiny-int8 `# Whisper model that will be used for transcription. From [here](https://github.com/SYSTRAN/faster-whisper/blob/master/faster_whisper/utils.py#L12-L31), all with `-int8` compressed variants` \
  -e WHISPER_BEAM=1 `# Number of candidates to consider simultaneously during transcription. [OPTIONAL]` \
  -e WHISPER_LANG=en `# Language that you will speak to the add-on. [OPTIONAL]` \
  -p 10300:10300 `# Wyoming connection port.` \
  -v ${BASEDIR:-/srv/lsio}/faster-whisper/config:/config `# Local path for Whisper config files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/faster-whisper:latest
