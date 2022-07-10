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
MYIP=$(wget -qO- ipinfo.io/ip);
source /var/wisnucs/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
clear
IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "WEBSOCKET TLS" | cut -d: -f2|sed 's/ //g')"
otcp="$(cat ~/log-install.txt | grep -w "PORT OPENVPN TCP" | cut -d: -f2|sed 's/ //g')"
oudp="$(cat ~/log-install.txt | grep -w "PORT OPENVPN UDP" | cut -d: -f2|sed 's/ //g')"
ossl="$(cat ~/log-install.txt | grep -w "PORT OPENVPN SSL" | cut -d: -f2|sed 's/ //g')"
ows="$(cat ~/log-install.txt | grep -w "PORT OVPNWS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "WEBSOCKET NON TLS" | cut -d: -f2|sed 's/ //g')"
stunnel5port="$(cat ~/log-install.txt | grep -w "PORT STUNNEL5" | cut -d: -f2|sed 's/ //g')"
opensshport="$(cat ~/log-install.txt | grep -w "PORT OPENSSH" | cut -d: -f2|sed 's/ //g')"
dropbearport="$(cat ~/log-install.txt | grep -w "PORT DROPBEAR" | cut -d: -f2|sed 's/ //g')"
ssl="$(cat ~/log-install.txt | grep -w "PORT STUNNEL5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "PORT SQUID" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn3="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=tes`</dev/urandom tr -dc X-Z0-9 | head -c2`
hari="1"
Pass=1
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart stunnel5
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 TRIAL SSH DAN OVPN 🔰 \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Host  : $IP / $domain"
echo -e "Username  : $Login"
echo -e "Password  : $Pass"
echo -e "Dropbear  : 200,300"
echo -e "SSL/TLS  :$ssl"
echo -e "Port Squid  :$sqd"
echo -e "Websocket Tls  : 2087"
echo -e "Websocket NonTls  : 2086"
echo -e "OVPN Websocket  : 8080"
echo -e "OVPN Port TCP  : $ovpn"
echo -e "OVPN Port UDP  : $ovpn2"
echo -e "OVPN Port SSL  : 990"
echo -e "OVPN TCP  : http://$IP:88/tcp.ovpn"
echo -e "OVPN UDP  : http://$IP:88/udp.ovpn"
echo -e "OVPN SSL  : http://$IP:88/ssl.ovpn"
echo -e "BadVpn  : 7100-7200-7300"
echo -e "Created  : $hariini"
echo -e "Expired  : $expi"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "PAYLOAD SSH & OVPN WEBSOCKET"
echo -e "GET ws://bugmu.com/http/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
