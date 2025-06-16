# Use official Apache HTTP Server image
FROM httpd:2.4

# Install iptables and ping tools
RUN apt-get update && \
    apt-get install -y iptables iputils-ping

# Copy custom virtual hosts configuration
COPY vhosts.conf /usr/local/apache2/conf/extra/vhosts.conf

# Include virtual hosts configuration in the main Apache config
RUN echo "Include conf/extra/vhosts.conf" >> /usr/local/apache2/conf/httpd.conf

# Copy website files into Apache document root
COPY html/ /usr/local/apache2/htdocs/

# Copy and prepare the ICMP blocking script
COPY block-ping.sh /root/block-ping.sh
RUN chmod +x /root/block-ping.sh

# Apply ICMP blocking rule and then run Apache in foreground
CMD /root/block-ping.sh && httpd-foreground
