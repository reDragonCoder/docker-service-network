# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install BIND9, iptables and ping tools
RUN apt-get update && \
    apt-get install -y bind9 bind9utils bind9-doc dnsutils iptables iputils-ping

# Create the directory to hold zone files
RUN mkdir -p /etc/bind/zones

# Copy BIND configuration
COPY named.conf /etc/bind/named.conf
COPY zones/db.localnet /etc/bind/zones/db.localnet

# Copy ping blocking script
COPY block-ping.sh /root/block-ping.sh
RUN chmod +x /root/block-ping.sh

# Start the ping-blocking script and then run the DNS server
CMD /root/block-ping.sh && named -g
