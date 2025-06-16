# Base image: Ubuntu 20.04
FROM ubuntu:20.04

# Disable interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install Squid, iptables and ping
RUN apt-get update && \
    apt-get install -y squid iptables iputils-ping && \
    mkdir -p /etc/squid/blacklist

# Copy Squid config and blacklist
COPY squid.conf /etc/squid/squid.conf
COPY blacklist /etc/squid/blacklist

# Copy and set permissions for ICMP block script
COPY block-ping.sh /root/block-ping.sh
RUN chmod +x /root/block-ping.sh

# Apply ICMP blocking and start Squid
CMD /root/block-ping.sh && squid -N -d1
