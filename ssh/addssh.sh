#!/bin/bash

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting

domain=$(cat /etc/xray/domain)
sldomain=$(cat /root/nsdomain)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "WEBSOCKET TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "WEBSOCKET NON TLS" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "STUNNEL5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
#systemctl stop client-sldns
#systemctl stop server-sldns
pkill sldns-server
pkill sldns-client
#systemctl enable client-sldns
#systemctl enable server-sldns
#systemctl start client-sldns
#systemctl start server-sldns
#systemctl restart client-sldns
#systemctl restart server-sldns
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 AKUN SSH DAN OVPN 🔰  \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Username: $Login"
echo -e "Password: $Pass"
echo -e "Created: $hariini"
echo -e "Expired: $expi"
echo -e "IP/Host: $IP"
echo -e "Domain SSH: $domain"
echo -e "Dropbear:200, 300"
echo -e "SSL/TLS: 500, 600"
echo -e "Port Ssh WS Tls: 2087"
echo -e "Port Ssh WS NonTls: 2086"
echo -e "Port OVPN WS: 8080"
echo -e "BadVPN/UDPGW: 7100,7200,7300"
echo -e "Proxy Squid: 3128, 3228"
echo -e "OVPN Port TCP: $ovpn"
echo -e "OVPN Port UDP: $ovpn2"
echo -e "OVPN Port SSL: 900"
echo -e "OVPN TCP: http://$IP:88/tcp.ovpn"
echo -e "OVPN UDP: http://$IP:88/udp.ovpn"
echo -e "OVPN SSL: http://$IP:88/ssl.ovpn"
echo -e "Payload SSH WEBSOCKET"
echo -e "GET wss://bug.com/ HTTP/1.1[crlf]Host:[host][crlf]Upgrade:websocket[crlf][crlf]"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "Payload OVPN WEBSOCKET"
echo -e "GET /HTTP/1.1[crlf]Host:$domain[crlf]Upgrade:websocket[crlf][crlf]"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
