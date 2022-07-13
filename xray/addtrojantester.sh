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
domain=$(cat /etc/xray/domain)

uuid=$(cat /proc/sys/kernel/random/uuid)
tquic="$(cat ~/log-install.txt | grep -w "TROJAN QUIC" | cut -d: -f2|sed 's/ //g')"
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
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/xtrojan.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /usr/local/etc/xray/xvmess.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /usr/local/etc/xray/vlessquic.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/trojangrpc.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
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
#exp=`date -d "$masaaktif seconds" +"%Y-%m-%d"`
sed -i '/#trojan-grpc$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#trojan-grpc$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
#sed -i '/#trojan-grpc$/a\#&# '"$user $exp"'\
#},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/trojangrpc.json
sed -i '/#trojan-xtls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","flow": "'""xtls-rprx-direct""'", "email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#trojan-hdua$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#trojan-hdua$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/trojangrpc.json
sed -i '/#trojan-hdua$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#trojan-tls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
#sed -i '/#trojan-nontls$/a\#&# '"$user $exp"'\
#},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/satrio.json
sed -i '/#trojan-gfw$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#trojan-nontls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#trojan-quic$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#trojan-http-tls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/xvmess.json
sed -i '/#trojan-http-tls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#trojan-http-nontls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#xray-ss-udp$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#xray-ss-tls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#xray-ss-nontls$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/"'""$uuid""'"$/a\,"'""$uuid""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
#exp2=`date -d "$masaaktif seconds" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
trojango="trojan-go://${uuid}@${domain}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=/gandring&encryption=none#%F0%9F%94%B0TROJAN+GO+$user"
trojanhdua="trojan://${uuid}@${domain}:$thdua?sni=jambualas.id&type=http&security=tls&path=/gandringhttp#%F0%9F%94%B0TROJAN+H2C+TLS+${user}"
trojangrpc="trojan://${uuid}@${domain}:$tgrpc?mode=gun&security=tls&type=grpc&serviceName=/gandringgrpc&sni=${domain}#%F0%9F%94%B0TROJAN+GRPC+TLS+${user}"
trojanxtls="trojan://${uuid}@${domain}:$txtls?sni=kimcil.kepolen.net&security=xtls&type=tcp&headerType=none&flow=xtls-rprx-splice-udp443#%F0%9F%94%B0TROJAN+XTLS+${user}"
trojangfw="trojan://$uuid@$domain:$tgfw?sni=angeladesah.com&type=tcp&security=tls&headerType=none#%F0%9F%94%B0TROJAN+GFW+TLS+$user"
trojantls="trojan://${uuid}@${domain}:$ttls?type=ws&security=tls&host=$domain&path=%2fgandring&sni=$domain#%F0%9F%94%B0TROJAN+WS+TLS+${user}"
trojannontls="trojan://${uuid}@${domain}:$tnontls?type=ws&security=none&host=$domain&path=%2fgandring#%F0%9F%94%B0TROJAN+WS+NONTLS+${user}"
trojanhttp="trojan://${uuid}@${domain}:$thttp?sni=gesekan.penghancur-janda.com&type=tcp&security=tls&host=$domain&path=/gandringtcp&headerType=http#%F0%9F%94%B0+HTTP+TLS+${user}"
trojanhttpnon="trojan://${uuid}@${domain}:$thttpnon?sni=gesekan.penghancur-janda.com&type=tcp&security=none&host=$domain&headerType=http#%F0%9F%94%B0TROJAN+HTTP+NONTLS+${user}"
trojanquic="trojan://$uuid@$MYIP:$tquic?sni=$domain&quicSecurity=$domain&key=gandringquic&security=tls&type=quic&headerType=none#%F0%9F%94%B0TROJAN+QUIC+TLS+$user"
systemctl restart xray.service
systemctl restart vlessquic
systemctl restart xtrojan.service
systemctl restart xvless
systemctl restart xvmess
systemctl restart trojangrpc
service cron restart
echo -e ""
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 AKUN TROJAN TESTER 🔰 \e[m"       
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "IP  :${MYIP} / $domain"
echo -e "NAMA  :${user}"
echo -e "Protokol  :GRPC,H2C,GFW,XTLS,WS,HTTP,GO,QUIC"
echo -e "Flow xtls  :only origin type not supported"
echo -e "ServiceName  :/gandringrpc"
echo -e "Path HTTP  :/gandringtcp"
echo -e "Path H2C  :/gandringhttp"
echo -e "Path WS  :/gandring"
echo -e "Path QUIC  :gandringquic"
echo -e "Port GRPC  :${tgrpc}"
echo -e "Port WSTLS  :${ttls} , $tnontls"
echo -e "Port H2C  :${thdua}"
echo -e "Port HTTP TLS  :${thttp} , $thttpnon"
echo -e "Port GFW  :${tgfw}"
echo -e "Port XTLS  :${txtls}"
echo -e "Port QUIC  :${tquic}"
echo -e "Sandi :${uuid}"
echo -e "Dibuat  :$hariini"
echo -e "Kadaluarsa  :$exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN QUIC: ${trojanquic}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN GRPC: ${trojangrpc}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN XTLS: ${trojanxtls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN GFW: ${trojangfw}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN H2C: ${trojanhdua}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN WS TLS: ${trojantls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN WS NONTLS: ${trojannontls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN HTTP TLS: ${trojanhttp}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN HTTP NONTLS: ${trojanhttpnon}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TROJAN GO: ${trojango}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
