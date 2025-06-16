#!/bin/bash

echo "== Running firewall tests from test-client =="

# Test 1: HTTP (port 80) — Should be blocked
echo "== Test 1: HTTP (port 80) — Should be blocked =="
curl -I --max-time 5 http://example.com &>/dev/null
if [ $? -ne 0 ]; then
    echo "Test 1 Passed: HTTP access blocked"
else
    echo "Test 1 Failed: HTTP access allowed"
fi

# Test 2: FTP (port 21) — Should be blocked
echo
echo "== Test 2: FTP (port 21) — Should be blocked =="
curl --max-time 5 ftp://195.144.107.198 &>/dev/null
if [ $? -ne 0 ]; then
    echo "Test 2 Passed: FTP access blocked"
else
    echo "Test 2 Failed: FTP access allowed"
fi

# Test 3: IP Range 192.168.0.10–100 — Should be blocked
echo
echo "== Test 3: IP Range 192.168.0.10–100 — Should be blocked =="
curl --max-time 5 http://192.168.0.50 &>/dev/null
if [ $? -ne 0 ]; then
    echo "Test 3 Passed: Access to IP range blocked"
else
    echo "Test 3 Failed: Access to IP range allowed"
fi

# Test 4: ICMP Echo Reply — Should NOT reply to ping
echo
echo "== Test 4: ICMP Echo Reply — Should NOT reply to ping =="
echo " This test must be run FROM ANOTHER CONTAINER."
echo "    Example: docker exec proxy ping -c 1 172.20.0.40"
echo "    Expected result: 'sendmsg: Operation not permitted' or no reply."

# Test 5: SMTP (port 25) — Should be blocked for this MAC
echo
echo "== Test 5: SMTP (port 25) — Should be blocked for this MAC =="
curl --max-time 5 telnet://gmail-smtp-in.l.google.com:25 &>/dev/null
if [ $? -ne 0 ]; then
    echo "Test 5 Passed: SMTP connection blocked"
else
    echo "Test 5 Failed: SMTP connection allowed"
fi

# Show counters
echo
echo "== IPTABLES rule counters =="
iptables -L OUTPUT -v -n
