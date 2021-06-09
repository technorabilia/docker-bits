# [Endlessh](https://github.com/skeeto/endlessh) is an SSH tarpit that very
# slowly sends an endless, random SSH banner. It keeps SSH clients locked up for
# hours or even days at a time. The purpose is to put your real SSH server on
# another port and then let the script kiddies get stuck in this tarpit instead
# of bothering a real server.

source ./.env
docker run -d \
  --name=endlessh \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e MSDELAY=10000 `# optional` `# The endless banner is sent one line at a time. This is the delay in milliseconds between individual lines.` \
  -e MAXLINES=32 `# optional` `# The length of each line is randomized. This controls the maximum length of each line. Shorter lines may keep clients on for longer if they give up after a certain number of bytes.` \
  -e MAXCLIENTS=4096 `# optional` `# Maximum number of connections to accept at a time. Connections beyond this are not immediately rejected, but will wait in the queue.` \
  -e LOGFILE=false `# optional` `# By default, the app logs to container log. If this is set to `true`, the log will be output to file under `/config/logs/endlessh` (`/config` needs to be mapped).` \
  -e BINDFAMILY= `# optional` `# By default, the app binds to IPv4 and IPv6 addresses. Set it to `4` or `6` to bind to IPv4 only or IPv6 only, respectively. Leave blank to bind to both.` \
  -p 22:2222 `# ssh port` \
  -v ${BASEDIR:-/volume1/docker}/endlessh/config:/config `# optional` `# Required if `LOGFILE` is set to `true`.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/endlessh
