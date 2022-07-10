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
MYIP=$(wget -qO- https://ipv4.icanhazip.com);
MYIP6=$(wget -qO- https://ipv6.icanhazip.com);
clear
Password=$Username
domain=$(cat /etc/xray/domain)
vmgrpc="$(cat ~/log-install.txt | grep -w "VMESS GRPC TLS" | cut -d: -f2|sed 's/ //g')"
vquic="$(cat ~/log-install.txt | grep -w "VLESS QUIC" | cut -d: -f2|sed 's/ //g')"
tquic="$(cat ~/log-install.txt | grep -w "TROJAN QUIC" | cut -d: -f2|sed 's/ //g')"
vmhdua="$(cat ~/log-install.txt | grep -w "VMESS H2C TLS" | cut -d: -f2|sed 's/ //g')"
vmquic="$(cat ~/log-install.txt | grep -w "VMESS QUIC" | cut -d: -f2|sed 's/ //g')"
vmhttp="$(cat ~/log-install.txt | grep -w "VMESS HTTP TLS" | cut -d: -f2|sed 's/ //g')"
vmhttpnon="$(cat ~/log-install.txt | grep -w "VMESS HTTP NON TLS" | cut -d: -f2|sed 's/ //g')"
tls="$(cat ~/log-install.txt | grep -w "VMESS WS TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "VMESS WS NON TLS" | cut -d: -f2|sed 's/ //g')"
vlgrpc="$(cat ~/log-install.txt | grep -w "VLESS GRPC TLS" | cut -d: -f2|sed 's/ //g')"
vlgrpcnon="$(cat ~/log-install.txt | grep -w "VLESS GRPC NON TLS" | cut -d: -f2|sed 's/ //g')"
vlxtls="$(cat ~/log-install.txt | grep -w "VLESS XTLS" | cut -d: -f2|sed 's/ //g')"
vlnontls="$(cat ~/log-install.txt | grep -w "VLESS WS NON TLS" | cut -d: -f2|sed 's/ //g')"
vltls="$(cat ~/log-install.txt | grep -w "VLESS WS TLS" | cut -d: -f2|sed 's/ //g')"
vlhdua="$(cat ~/log-install.txt | grep -w "VLESS H2C TLS" | cut -d: -f2|sed 's/ //g')"
vlhduanon="$(cat ~/log-install.txt | grep -w "VLESS H2C NON TLS" | cut -d: -f2|sed 's/ //g')"
vlhttp="$(cat ~/log-install.txt | grep -w "VLESS HTTP TLS" | cut -d: -f2|sed 's/ //g')"
vlhttpnon="$(cat ~/log-install.txt | grep -w "VLESS HTTP NON TLS" | cut -d: -f2|sed 's/ //g')"
tls="$(cat ~/log-install.txt | grep -w "VMESS WS TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "VMESS WS NON TLS" | cut -d: -f2|sed 's/ //g')"
uuid=$(cat /proc/sys/kernel/random/uuid)
tgrpc="$(cat ~/log-install.txt | grep -w "TROJAN GRPC" | cut -d: -f2|sed 's/ //g')"
txtls="$(cat ~/log-install.txt | grep -w "TROJAN XTLS" | cut -d: -f2|sed 's/ //g')"
tgfw="$(cat ~/log-install.txt | grep -w "TROJAN GFW" | cut -d: -f2|sed 's/ //g')"
thdua="$(cat ~/log-install.txt | grep -w "TROJAN H2C" | cut -d: -f2|sed 's/ //g')"
thttp="$(cat ~/log-install.txt | grep -w "TROJAN HTTP TLS" | cut -d: -f2|sed 's/ //g')"
thttpnon="$(cat ~/log-install.txt | grep -w "TROJAN HTTP NON TLS" | cut -d: -f2|sed 's/ //g')"
ttls="$(cat ~/log-install.txt | grep -w "TROJAN WS TLS" | cut -d: -f2|sed 's/ //g')"
tnontls="$(cat ~/log-install.txt | grep -w "TROJAN WS NON TLS" | cut -d: -f2|sed 's/ //g')"
trgo="$(cat ~/log-install.txt | grep -w "TROJAN GO" | cut -d: -f2|sed 's/ //g')"
ssudp="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS UDP" | cut -d: -f2|sed 's/ //g')"
sswstls="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS WS TLS" | cut -d: -f2|sed 's/ //g')"
sswsnontls="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS WS NON TLS" | cut -d: -f2|sed 's/ //g')"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xvless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/xvmess.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xtrojan.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/trojangrpc.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/vlessquic.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
#read -p "Expired (Seconds) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
#exp2=`date -d "$masaaktif seconds" +"%Y-%m-%d"`
sed -i '/#vless-xtls$/a\#&# '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'", "email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#vless-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#vless-grpc-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-http-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#vless-grpc-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#vless-hdua$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-hdua$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#trojan-tls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#trojan-gfw$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#trojan-quic$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-quic$/a\#&# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-quic$/a\#&# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vlessquic.json
sed -i '/#trojan-hdua$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#trojan-hdua$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/trojangrpc.json
sed -i '/#trojan-http-tls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#trojan-hdua$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#trojan-grpc$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#trojan-grpc$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /usr/local/etc/xray/xvmess.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "4",
      "ps": "🔰VMESS WS TLS ${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/shanum",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
rm -rf /etc/xray/vmess-$user-tls.json

sed -i '/#vmess-http-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /usr/local/etc/xray/xvmess.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "5",
      "ps": "🔰VMESS HTTP TLS ${user}",
      "add": "${domain}",
      "port": "${vmhttp}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "/shanumtcp",
      "type": "http",
      "host": "${domain}",
      "tls": "tls"
}
EOF
vmesshttp_base641=$( base64 -w 0 <<< $vmess_json1)
vmesshttp="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
rm -rf /etc/xray/vmess-$user-tls.json

vlessquic="vless://$uuid@$MYIP:$vquic?sni=$domain&key=wisnuquic&security=tls&encryption=none&headerType=none&quicSecurity=$domain&type=quic#%F0%9F%94%B0VLESS+QUIC+TLS+$user"
vlesshttpnon="vless://${uuid}@${domain}:$vlhttpnon?host=${domain}&security=none&type=tcp&headerType=http&encryption=none#%F0%9F%94%B0VLESS+HTTP+NONTLS+${user}"
vlesshttp="vless://${uuid}@${domain}:$vlhttp?sni=${domain}&host=${domain}&type=tcp&security=tls&path=/wisnutcp&headerType=http&encryption=none#%F0%9F%94%B0VLESS+HTTP+TLS+${user}"
vlesstls="vless://${uuid}@${domain}:$vltls?host=${domain}&sni=${domain}&type=ws&security=tls&path=%2fwisnu&encryption=none#%F0%9F%94%B0VLESS+WS+TLS+${user}"
vlessnontls="vless://${uuid}@${domain}:$vlnontls?host=${domain}&security=none&type=ws&path=/wisnu&encryption=none#${user}"
vlessgrpc="vless://${uuid}@${domain}:$vlgrpc?serviceName=/wisnugrpc&sni=${domain}&mode=multi&type=grpc&security=tls&encryption=none#%F0%9F%94%B0VLESS+GRPC+TLS+${user}"
vlessgrpcnon="vless://${uuid}@${domain}:$vlgrpcnon?serviceName=/wisnugrpc&sni=${domain}&mode=multi&type=grpc&security=none&encryption=none#${user}"
vlesshdua="vless://${uuid}@${domain}:$vlhdua?type=http&security=tls&path=/wisnuhttp&encryption=none#%F0%9F%94%B0VLESS+H2C+TLS+${user}"
#vlesshduanon="vless://${uuid}@${domain}:$vlhduanon?type=http&security=none&path=/bagus&encryption=none#${user}"
vlessxtls="vless://${uuid}@${domain}:$vlxtls?security=xtls&encryption=none&flow=xtls-rprx-splice-udp443#%F0%9F%94%B0VLESS+XTLS+${user}"
vlessgfw="vless://${uuid}@${domain}:$vlxtls?security=tls&encryption=none#%F0%9F%94%B0VLESS+GFW+TLS+${user}"
trojanxtls="trojan://${uuid}@${domain}:$txtls?security=xtls&type=tcp&headerType=none&flow=xtls-rprx-splice-udp443#%F0%9F%94%B0TROJAN+XTLS+${user}"
trojangfw="trojan://$uuid@$domain:$tgfw?type=tcp&security=tls&headerType=none#%F0%9F%94%B0TROJAN+GFW+TLS+$user"
trojantls="trojan://${uuid}@${domain}:$ttls?type=ws&security=tls&host=$domain&path=%2fgandring&sni=$domain#%F0%9F%94%B0TROJAN+WS+TLS+$user"
trojanhttp="trojan://${uuid}@${domain}:$thttp?sni=${domain}&type=tcp&security=tls&host=$domain&path=/gandringtcp&headerType=http#%F0%9F%94%B0TROJAN+HTTP+TLS+${user}"
trojanhdua="trojan://$uuid@$domain:$thttp?sni=angilangilgamping.com&type=http&security=tls&path=/gandringhttp#%F0%9F%94%B0TROJAN+H2C+TLS+$user"
trojanquic="trojan://$uuid@$MYIP:$tquic?sni=$domain&quicSecurity=$domain&key=gandringquic&security=tls&type=quic&headerType=none#%F0%9F%94%B0TROJAN+QUIC+TLS+$user"
trojangrpc="trojan://$uuid@$domain:$tgrpc?serviceName=/gandringgrpc&sni=$domain&mode=gun&security=tls&type=grpc#%F0%9F%94%B0TROJAN+GRPC+TLS+$user"
systemctl restart xvless.service
systemctl restart xray.service
systemctl restart xtrojan.service
systemctl restart trojangrpc
systemctl restart xvmess
systemctl restart vlessquic
service cron restart
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰 AKUN AIO PORT TESTER 🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "IP  :${MYIP} / $domain"
echo -e "Protokol  :GRPC,HTTP,H2C,GFW,XTLS,WS,QUIC"
echo -e "NAMA  :${user}"
echo -e "Port SERVICE  :$vlxtls"
echo -e "Port Trojan grpc  :$tgrpc"
echo -e "Port Vless grpc  :$vlgrpc"
echo -e "Satpam  :tls,xtls"
echo -e "Path VLESS WS  :/wisnu"
echo -e "Path VLESS HTTP  :/wisnutcp"
echo -e "Path VMESS WS  :/shanum"
echo -e "Path VMESS HTTP  :/shanumtcp"
echo -e "Path TROJAN WS  :/gandring"
echo -e "Path TROJAN HTTP  :/gandringtcp"
echo -e "UserID  :${uuid}"
echo -e "Dibuat  :$hariini"
echo -e "Kadaluarsa  :$exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
#echo -e "VLESS QUIC: ${vlessquic}"
#echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VLESS XTLS: ${vlessxtls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VLESS GRPC TLS: ${vlessgrpc}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VLESS GFW TLS: ${vlessgfw}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VLESS WS TLS: ${vlesstls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VLESS HTTP TLS: ${vlesshttp}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN QUIC TLS: ${trojanquic}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN GFW TLS: ${trojangfw}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN WS TLS: ${trojantls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN HTTP TLS: ${trojanhttp}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN GRPC TLS: ${trojangrpc}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VMESS WS TLS: ${vmess1}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VMESS HTTP TLS: ${vmesshttp}"
#echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
#echo -e "VMESS QUIC TLS: ${vmessquic}"
#echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
#echo -e "VLESS H2C TLS: ${vlesshdua}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
