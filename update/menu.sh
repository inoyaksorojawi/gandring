#!/bin/bash
#script by wisnu cokro satrio
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'
#cat /usr/bin/bannerku | lolcat
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m             🔰 PRESTIGE SERVER ZEROSSL 🔰              \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "01\e[0;33m) MENU LAYANAN VMESS  \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "02\e[0;33m) MENU LAYANAN VLESS  \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "03\e[0;33m) MENU LAYANAN TROJAN  \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "04\e[0;33m) MENU LAYANAN SHADOWSOCKS  \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "05\e[0;33m) MENU LAYANAN SSH DAN OPENVPN \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "06\e[0;33m) MENU TESTER SERVER VLESS TROJAN VMESS \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "07\e[0;33m) MENU LAYANAN L2TP PPTP SSTP DAN WIREGUARD \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "08\e[0;33m) MENU LAYANAN KONFIGURASI SERVER ANDA \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "00\e[1;31m) NOMER IKI METU OM \e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m             🔰 LUXURY EDITION BY ZEROSSL 🔰            \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
#echo -e "\e[0;31m   ⇱ TEKAN K UNTUK KE VERSI LONDO ⇲  \e[m"
echo -e "\e[0;31m   ⇱ PRESS K FOR ENGLISH VERSION ⇲   \e[m"
read -p "   ⇱ Silahkan Pilih Angka [ 1 - 0 ] ⇲: " menu
echo -e ""
case $menu in
1)
clear
vmessmenu
;;
2)
clear
vlessmenu
;;
3)
clear
trxtmenu
;;
4)
clear
ssmenu
;;
5)
clear
sshovpnmenu
;;
6)
clear
testermenu
;;
7)
clear
l2tppmenu
;;
8)
clear
setmenu
;;
0)
clear
status
;;
k)
clear
menuu
;;
*)
clear
menu
;;
esac
