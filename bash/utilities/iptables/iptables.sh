#!/bin/bash

sudo iptables -F

iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --ports 12000:12100 -j ACCEPT
iptables -A INPUT -p tcp -s 10.7.0.163 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 127.0.0.1 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j DROP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 8443 -j ACCEPT
iptables -A INPUT -p tcp --dport 2053 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --ports 25565:25568 -j ACCEPT
iptables -A INPUT -p tcp --dport 8211 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --ports 27015:27016 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --port 50001:51000 -j ACCEPT
iptables -A INPUT -p tcp --dport 10000 -j ACCEPT
iptables -A INPUT -p tcp --dport 33073 -j ACCEPT
iptables -A INPUT -p tcp --dport 3478 -j ACCEPT
iptables -I INPUT -p tcp -s 10.7.0.67 --dport 389 -j ACCEPT
iptables -I INPUT -p tcp --dport 3479 -j ACCEPT
iptables -I INPUT -p tcp --dport 8089 -j ACCEPT
iptables -A INPUT -p udp -m multiport --ports 51821:51830 -j ACCEPT
iptables -I INPUT -p tcp --dport 2222 -j ACCEPT

iptables -A INPUT -i docker0 -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT -m state --state INVALID -j DROP