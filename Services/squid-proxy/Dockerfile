FROM ubuntu:22.04

RUN apt update && apt install -y squid

COPY squid.conf /etc/squid/squid.conf
COPY blacklist /etc/squid/blacklist

EXPOSE 3128

CMD ["squid", "-N", "-d", "1"]