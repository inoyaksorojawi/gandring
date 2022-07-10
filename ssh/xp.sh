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
data=( `cat /var/lib/wisnucs/data-user-l2tp | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/var/lib/wisnucs/data-user-l2tp" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/d" "/var/lib/wisnucs/data-user-l2tp"
sed -i '/^"'"$user"'" l2tpd/d' /etc/ppp/chap-secrets
sed -i '/^'"$user"':\$1\$/d' /etc/ipsec.d/passwd
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
fi
done
data=( `cat /var/lib/wisnucs/data-user-pptp | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/var/lib/wisnucs/data-user-pptp" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/d" "/var/lib/wisnucs/data-user-pptp"
sed -i '/^"'"$user"'" pptpd/d' /etc/ppp/chap-secrets
chmod 600 /etc/ppp/chap-secrets*
fi
done
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^port_http/d" "/etc/shadowsocks-libev/akun.conf"
systemctl disable shadowsocks-libev-server@$user-tls.service
systemctl disable shadowsocks-libev-server@$user-http.service
systemctl stop shadowsocks-libev-server@$user-tls.service
systemctl stop shadowsocks-libev-server@$user-http.service
rm -f "/etc/shadowsocks-libev/$user-tls.json"
rm -f "/etc/shadowsocks-libev/$user-http.json"
fi
done
data=( `cat /usr/local/shadowsocksr/akun.conf | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/d" "/usr/local/shadowsocksr/akun.conf"
cd /usr/local/shadowsocksr
match_del=$(python mujson_mgr.py -d -u "${user}"|grep -w "delete user")
cd
fi
done
/etc/init.d/ssrmu restart
data=( `cat /var/lib/wisnucs/data-user-sstp | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/var/lib/wisnucs/data-user-sstp" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/d" "/var/lib/wisnucs/data-user-sstp"
sed -i '/^'"$user"'/d' /home/sstp/sstp_account
fi
done
data=( `cat /etc/xray/config.json | grep '^#&#' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#&# $user" "/etc/xray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#&# $user $exp/,/^},{/d" /etc/xray/config.json
fi
done
systemctl restart xray.service
data=( `cat /etc/trojan-go/akun.conf | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/trojan-go/akun.conf
fi
done
systemctl restart trojan-go
data=( `cat /etc/wireguard/wg0.conf | grep '^### Client' | cut -d ' ' -f 3`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### Client $user" "/etc/wireguard/wg0.conf" | cut -d ' ' -f 4)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### Client $user $exp/,/^AllowedIPs/d" /etc/wireguard/wg0.conf
rm -f "/home/vps/public_html/$user.conf"
fi
done
systemctl restart wg-quick@wg0
data=( `cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-tls.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-nontls.json /etc/xray/vmess-$user-nontls.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-tls.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-nontls.json /etc/xray/vmess-$user-nontls.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-tls.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-nontls.json /etc/xray/vmess-$user-nontls.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-tls.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-tls.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-nontls.json /etc/xray/vmess-$user-nontls.json
fi
done
systemctl restart xray.service
systemctl restart xvmess
systemctl restart xvless
systemctl restart xtrojan
systemctl restart xray@.service
#systemctl restart v2ray.service
data=( `cat /etc/xray/config.json | grep '^####' | cut -d ' ' -f 2`);
#data=( `cat /etc/v2ray/config.json | grep '^####' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#### $user" "/etc/xray/config.json" | cut -d ' ' -f 3)
#exp=$(grep -w "^#### $user" "/etc/v2ray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/config.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
fi
done

exp=$(grep -w "^#### $user" "/etc/xray/xtrojan.json" | cut -d ' ' -f 3)
#exp=$(grep -w "^#### $user" "/etc/v2ray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/xtrojan.json
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/xtrojan.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
fi
done
systemctl restart xray.service
systemctl daemon-reload
systemctl restart xtrojan.service
systemctl restart xvmess.service
systemctl restart xless
exp=$(grep -w "^#### $user" "/etc/xray/xvless.json" | cut -d ' ' -f 3)
#exp=$(grep -w "^#### $user" "/etc/v2ray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/xvless.json
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/xvless.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
fi
done
##restart&start service
systemctl daemon-reload
systemctl stop xvless.service
systemctl start xvless.service
systemctl enable xvless.service
systemctl restart xvless.service
systemctl restart xvmess
systemctl restart xtrojan

exp=$(grep -w "^#### $user" "/usr/local/etc/xray/xvmess.json" | cut -d ' ' -f 3)
#exp=$(grep -w "^#### $user" "/etc/v2ray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#### $user $exp/,/^},{/d" /usr/local/etc/xray/xvmess.json
sed -i "/^#### $user $exp/,/^},{/d" /usr/local/etc/xray/xvmess.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
fi
done
##restart&start service
systemctl daemon-reload
systemctl stop xvmess.service
systemctl start xvmess.service
systemctl enable xvmess.service
systemctl restart xvmess.service

exp=$(grep -w "^#### $user" "/usr/local/etc/xray/vlessquic.json" | cut -d ' ' -f 3)
#exp=$(grep -w "^#### $user" "/etc/v2ray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#### $user $exp/,/^},{/d" /usr/local/etc/xray/vlessquic.json
sed -i "/^#### $user $exp/,/^},{/d" /usr/local/etc/xray/xvmess.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
fi
done
##restart&start service
systemctl daemon-reload
systemctl stop xvmess.service
systemctl start xvmess.service
systemctl enable xvmess.service
systemctl restart xvmess.service


exp=$(grep -w "^#### $user" "/etc/xray/xss.json" | cut -d ' ' -f 3)
#exp=$(grep -w "^#### $user" "/etc/v2ray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/xss.json
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/xss.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
fi
done
##restart&start service
systemctl daemon-reload
systemctl stop xss.service
systemctl start xss.service
systemctl enable xss.service
systemctl restart xss.service

exp=$(grep -w "^#### $user" "/etc/xray/trojangrpc.json" | cut -d ' ' -f 3)
exp=$(grep -w "^#### $user" "/etc/xray/vlessquic.json" | cut -d ' ' -f 3)
#exp=$(grep -w "^#### $user" "/etc/v2ray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/trojangrpc.json
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/vlessquic.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
#sed -i "/^#### $user $exp/,/^},{/d" /etc/v2ray/config.json
fi
done
##restart&start service
systemctl daemon-reload
systemctl stop trojangrpc.service
systemctl start trojangrpc.service
systemctl enable trojangrpc.service
systemctl restart trojangrpc.service

##restart&start service
systemctl daemon-reload
systemctl stop vlessquic.service
systemctl start vlessquic.service
systemctl enable vlessquic.service
systemctl restart vlessquic.service
