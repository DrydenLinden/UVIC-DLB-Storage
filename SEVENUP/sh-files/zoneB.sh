#!/bin/sh -x
#Firewall (IPTables) Configuration

#Flush/remove all existing rules
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -F

#Allow stablished/related connetions
sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands
#Allow All Incoming SSH
sudo iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT


#Allow Outgoing SSH
sudo iptables -A OUTPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT


#Allowing ALL DNS lookups (tcp, udp port 53)
sudo iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
sudo iptables -A INPUT  -p udp --sport 53 -m state --state ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 53 -m state --state ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 8080 -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 8080 -m state --state ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -s  192.168.50.8 -j ACCEPT
sudo iptables -A OUTPUT -d 192.168.50.8 -j ACCEPT

#Logs all traffic about to be blocked
#iptables -A INPUT -j LOG --log-prefix "DROP INPUT: " --log-level 7
#iptables -A OUTPUT -j LOG --log-prefix "DROP OUTPUT: " --log-level 7

#Blocks all other traffic not explicitly previously allowed
#sudo iptables -D OUTPUT -j DROP
sudo iptables -A INPUT -j DROP
sudo iptables -A OUTPUT -j DROP

#show iptables
sudo iptables -nL --line-numbers