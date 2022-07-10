#!/bin/bash
# My Telegram : https://t.me/zerossl
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
clear
domain=$(cat /etc/xray/domain)
sstls="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS WS TLS" | cut -d: -f2|sed 's/ //g')"
sstcp="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS TCP" | cut -d: -f2|sed 's/ //g')"
ssnontls="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS WS NON TLS" | cut -d: -f2|sed 's/ //g')"
ssudp="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS UDP" | cut -d: -f2|sed 's/ //g')"
ssnew="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS 2022" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${CLIENT_NAME}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-ss-new$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xss.json
cat>/etc/xray/ss-$user-new.json<<EOF
      {
  "inbounds": [
    {
      "port": 212,
      "protocol": "shadowsocks",
      "settings": {
        "method": "2022-blake3-aes-128-gcm",
        "password": "${user}",
        "network": "tcp,udp"
      }
    },
EOF
tmp5=$(echo -n "2022-blake3-aes-128-gcm:${user}@${domain}:$ssnew" | base64 -w0)
shadowsocksnew="ss://$tmp5#$user"
systemctl restart xray.service
systemctl restart xss.service
systemctl restart xtrojan.service
service cron restart
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m      🔰AKUN SHADOWSOCKS 🔰       \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks     : ${user}"
echo -e "IP/Host     : ${MYIP}"
echo -e "Address     : ${domain}"
#echo -e "Port TLS    : ${tls}"
echo -e "Port SS     : $ssnew"
echo -e "Security    : 2022-blake3-aes-128-gcm"
echo -e "Network     : tcp,udp"
echo -e "Password    : ${user}"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link SS new : ${shadowsocksnew}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m  🔰LUXURY EDITION BY ZEROSSL🔰   \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
