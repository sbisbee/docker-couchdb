docker-couchdb
==============

This repo is only for those modifying the images. To use the Docker images you
just need to use Docker.

  - Get the images: `docker pull sbisbee/couchdb`

  - Start CouchDB 1.5: `docker run sbisbee/couchdb:1.5`

This container does the following:

  - Installs and configures CouchDB from source.

  - Enables SSL and uses a self signed certificate, configured to listen on
    port 6984.

  - Automatically starts the couchdb service and makes it listen on localhost.

  - Provides images for 1.3, 1.4, and 1.5.
