FROM ubuntu:16.04
# MAINTAINER Philip Shaw <philip.shaw@reddersky.com>
# Copy installation scripts in
COPY *.sh ./
# Copy the apache configuration files ready for when we need them
COPY apache2/*.conf ./
# Prepare the system
RUN ./setup.sh
# Install dependencies
RUN ./dependencies.sh
# Install extras
RUN ./extras.sh
# Update libsrtp to 1.5.0 to avoid Janus issues with the default 1.4.x
RUN ./update-libsrtp.sh
# Install usrsctp for data channel support
RUN ./usrsctp.sh
# Install web sockets support
RUN ./websockets.sh
# Install and prepare apache
RUN ./apache.sh
# Fetch, build and install the gateway
RUN ./janus.sh
# Copy Janus config files
COPY janus/janus.plugin.streaming.cfg /opt/janus/etc/janus/
# Declare the ports we use
EXPOSE 5004 5004/udp 80 8088 8188 
# Define the default start-up command
CMD ./startup.sh
