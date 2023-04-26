# This internal tool is used as a desktop sandbox in our CI process to grab a
# screenshot of a hopefully functional endpoint

. ./.env
docker run -d \
  --name=tester \
  -e URL=http://google.com `# Specify an endpoint, the container will automatically determine the correct protocol and program to use` \
  -p 3000:3000 `# WebUI` \
  --restart unless-stopped \
  ghcr.io/linuxserver/tester
