# Riak Dockerfile
# 
# This is the default riak deb package (64 version) in top of ubuntu.
#
# To work arround the 1024 ulimit by docker the ring size was reduce to 8.
# Of course this is just for development porpouse, and not intended for
# production use.
#
FROM ubuntu
MAINTAINER Guillermo Álvarez <guillermo@cientifico.net>
ADD riak_1.4.2-1_amd64.deb /tmp/riak_1.4.2-1_amd64.deb
RUN apt-get install  libc6 libgcc1 libssl1.0.0 libstdc++6 libtinfo5 adduser logrotate sudo -y -y -y
RUN dpkg -i /tmp/riak_1.4.2-1_amd64.deb
RUN rm /tmp/riak_1.4.2-1_amd64.deb
ADD riak /usr/sbin/riak
ADD app.config /etc/riak/app.config
CMD /usr/sbin/riak start
EXPOSE 8098 8087
