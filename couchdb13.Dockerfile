# Apache CouchDB 1.3

FROM ubuntu
MAINTAINER Sam Bisbee <sam@sbisbee.com>

# Get us to a stable place
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# CouchDB dependencies
RUN apt-get install -y make g++ erlang-dev erlang-manpages erlang-base-hipe erlang-eunit erlang-nox erlang-xmerl erlang-inets libmozjs185-dev libicu-dev libcurl4-gnutls-dev libtool

# Alt dependencies
RUN apt-get install -y wget

# Set up our build environment
RUN bash -c 'cd /tmp && wget http://www.carfab.com/apachesoftware/couchdb/source/1.3.0/apache-couchdb-1.3.0.tar.gz && tar -zxvf apache-couchdb-1.3.0.tar.gz'

# Build and install CouchDB
RUN bash -c 'cd /tmp/apache-couchdb-1.3.0 && ./configure --prefix=/usr/local && make && make install'
RUN touch /usr/local/var/log/couchdb/couch.log

# Configure SSL
ADD ssl.ini /usr/local/etc/couchdb/local.d/ssl.ini
ADD key.pem /usr/local/etc/couchdb/key.pem
ADD cert.pem /usr/local/etc/couchdb/cert.pem

# Set up our users and permissions
RUN useradd -d /usr/local/lib/couchdb couchdb
RUN chown -R couchdb:couchdb /usr/local/var/lib/couchdb /usr/local/var/log/couchdb
RUN chown -R root:couchdb /usr/local/etc/couchdb
RUN chmod 664 /usr/local/etc/couchdb/*.ini
RUN chmod 775 /usr/local/etc/couchdb/*.d

# Start
CMD /usr/local/etc/init.d/couchdb start && tail -f /usr/local/var/log/couchdb/couch.log
