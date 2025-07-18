# [Ubooquity](https://vaemendis.net/ubooquity/) is a free, lightweight and easy-
# to-use home server for your comics and ebooks. Use it to access your files
# from anywhere, with a tablet, an e-reader, a phone or a computer.

. ./.env
docker run -d \
  --name=ubooquity \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e MAXMEM= `# To set the maximum memory. ( ex: set '1024' for 1GB ) [OPTIONAL]` \
  -p 2202:2202 `# The library port.` \
  -p 2203:2203 `# The admin port.` \
  -v ${BASEDIR:-/srv/lsio}/ubooquity/config:/config `# Config files and database for ubooquity.` \
  -v ${BASEDIR:-/srv/lsio}/ubooquity/books:/books `# Location of books.` \
  -v ${BASEDIR:-/srv/lsio}/ubooquity/comics:/comics `# Location of comics.` \
  -v ${BASEDIR:-/srv/lsio}/ubooquity/files:/files `# Location of raw files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/ubooquity:latest
