#!/bin/bash
echo "== Blocking ICMP echo-reply =="

# Delete any existing rule that matches echo-reply to avoid duplicates
iptables -D OUTPUT -p icmp --icmp-type echo-reply -j DROP -m comment --comment "Rule 4: Block ICMP Echo Reply" 2>/dev/null

# Add the rule to block ICMP echo-reply
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP -m comment --comment "Rule 4: Block ICMP Echo Reply"

echo "ICMP echo-reply blocked"
