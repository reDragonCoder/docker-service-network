FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required tools
RUN apt update && \
    apt install -y curl dnsutils iputils-ping iproute2 iptables nano && \
    apt clean

# Set custom DNS resolver (to point to your BIND container)
COPY resolv.conf /etc/resolv.conf

# Copy firewall, test, and ICMP block scripts
COPY iptables-apply.sh /root/iptables-apply.sh
COPY test.sh /root/test.sh
COPY block-ping.sh /root/block-ping.sh

# Make all scripts executable
RUN chmod +x /root/iptables-apply.sh /root/test.sh /root/block-ping.sh

# Keep container running
CMD ["sleep", "infinity"]
