# [Scrutiny](https://github.com/AnalogJ/scrutiny) WebUI for smartd S.M.A.R.T
# monitoring. Scrutiny is a Hard Drive Health Dashboard & Monitoring solution,
# merging manufacturer provided S.M.A.R.T metrics with real-world failure rates
# from Backblaze.

source ./.env
docker run -d \
  --name=scrutiny \
  --cap-add=SYS_RAWIO \
  --cap-add=SYS_ADMIN `# optional` \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SCRUTINY_API_ENDPOINT=http://localhost:8080 `# # optional - API endpoint of the scrutiny UI. Do not change unless using as a remote collector` \
  -e SCRUTINY_WEB=true `# # optional - Run the web service.` \
  -e SCRUTINY_COLLECTOR=true `# # optional - Run the metrics collector.` \
  -p 8080:8080 `# Port for scrutiny's web interface and API.` \
  -v ${BASEDIR:-/volume1/docker}/scrutiny/config:/config `# Where config is stored.` \
  -v /run/udev:ro:/run/udev:ro `# Provides necessary metadata to Scrutiny.` \
  --device /dev/sda:/dev/sda `# This is how Scrutiny accesses drives. Optionally supply `/dev:/dev` instead for all devices.` \
  --device /dev/sdb:/dev/sdb `# A second drive.` \
  --device /dev/nvme1n1:/dev/nvme1n1 `# An NVMe drive. NVMe requires `--cap-add=SYS_ADMIN`.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/scrutiny
