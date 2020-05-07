#! /bin/bash

IPTABLES=/sbin/iptables

WANIF='enxa0cec80eba42'
LANIF='eth0'

echo 'Stopping LAN IP Masquerade'

echo 'Disable Kernel IP forwarding...'
/bin/echo 0 > /proc/sys/net/ipv4/ip_forward

# flush rules and delete chains
echo 'Flushing ALL rules and deleting existing chains...'

$IPTABLES -P INPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -t nat -F
$IPTABLES -t mangle -F
$IPTABLES -F

echo 'Done.'
