#!/bin/bash
echo "== Applying IPTABLES rules in test-client =="

# Flush all existing rules to ensure clean state
iptables -F
iptables -X

# === Rule 3: Block access to IP range 192.168.0.10–192.168.0.100 ===
# This must go first to take precedence over general port blocks
iptables -A OUTPUT -d 192.168.0.10/31 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.12/30 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.16/28 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.32/27 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.64/28 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.80/29 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.88/30 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.92/31 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.94 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.95 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.96/30 -j REJECT -m comment --comment "Rule 3: Block IP range"
iptables -A OUTPUT -d 192.168.0.100 -j REJECT -m comment --comment "Rule 3: Block IP range"

# === Rule 1: Block HTTP traffic (port 80) ===
iptables -A OUTPUT -p tcp --dport 80 -j REJECT -m comment --comment "Rule 1: Block HTTP (port 80)"

# === Rule 2: Block FTP traffic (port 21) ===
iptables -A OUTPUT -p tcp --dport 21 -j REJECT -m comment --comment "Rule 2: Block FTP (port 21)"

# === Rule 4: Block ICMP Echo Reply ===
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP -m comment --comment "Rule 4: Block ICMP Echo Reply"

# === Rule 5 (simulated): Block SMTP (port 25) ===
iptables -A OUTPUT -p tcp --dport 25 -j REJECT -m comment --comment "Rule 5 (Simulated): Block SMTP for test-client"

echo "All rules applied."

