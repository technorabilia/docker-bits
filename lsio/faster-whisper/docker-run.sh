# [Faster-whisper](https://github.com/SYSTRAN/faster-whisper) is a
# reimplementation of OpenAI's Whisper model using CTranslate2, which is a fast
# inference engine for Transformer models. This container provides a Wyoming
# protocol server for faster-whisper.

. ./.env
docker run -d \
  --name=faster-whisper \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e WHISPER_MODEL=tiny-int8 `# Whisper model that will be used for transcription. From [here](https://github.com/SYSTRAN/faster-whisper/blob/master/faster_whisper/utils.py#L12-L31), all with `-int8` compressed variants` \
  -e WHISPER_BEAM=1 `# optional` `# Number of candidates to consider simultaneously during transcription.` \
  -e WHISPER_LANG=en `# optional` `# Language that you will speak to the add-on.` \
  -p 10300:10300 `# Wyoming connection port.` \
  -v ${BASEDIR:-/volume1/docker}/faster-whisper/config:/config `# Local path for Whisper config files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/faster-whisper
