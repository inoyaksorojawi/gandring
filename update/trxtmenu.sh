
#!/bin/bash

m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
#cat /usr/bin/bannerTROJAN | lolcat
echo -e ""
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m   🔰 MENU TROJAN XTLS GFW H2C GRPC WS HTTP & GO 🔰     \e[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "01\e[1;33m) Buat Akun TROJAN XTLS & GFW \e[m"
echo -e "02\e[1;33m) Hapus Akun TROJAN XTLS & GFW \e[m"
echo -e "03\e[1;33m) Perpanjang Masa Aktif Akun TROJAN XTLS & GFW \e[m"
echo -e "04\e[1;33m) Cek User Login TROJAN XTLS \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "05\e[1;33m) Buat Akun TROJAN H2C \e[m"
echo -e "06\e[1;33m) Hapus Akun TROJAN H2C \e[m"
echo -e "07\e[1;33m) Perpanjang Masa Aktif Akun TROJAN H2C \e[m"
echo -e "08\e[1;33m) Cek User Login Trojan H2C \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "09\e[1;33m) Buat Akun TROJAN GRPC \e[m"
echo -e "10\e[1;33m) Hapus Akun TROJAN GRPC \e[m"
echo -e "11\e[1;33m) Perpanjang Masa Aktif Akun TROJAN GRPC \e[m"
echo -e "12\e[1;33m) Cek User Login TROJAN GRPC \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "13\e[1;33m) Buat Akun TROJAN WEBSOCKET \e[m"
echo -e "14\e[1;33m) Hapus Akun TROJAN WEBSOCKET  \e[m"
echo -e "15\e[1;33m) Perpanjang Masa Aktif Akun TROJAN WEBSOCKET  \e[m"
echo -e "16\e[1;33m) Cek User Login TROJAN WEBSOCKET  \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "17\e[1;33m) Buat Akun TROJAN HTTP \e[m"
echo -e "18\e[1;33m) Hapus Akun TROJAN HTTP \e[m"
echo -e "19\e[1;33m) Perpanjang Masa Aktif Akun TROJAN HTTP \e[m"
echo -e "20\e[1;33m) Cek User Login TROJAN HTTP \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "21\e[1;33m) Buat Akun TROJAN GO \e[m"
echo -e "22\e[1;33m) Hapus Akun TROJAN GO \e[m"
echo -e "23\e[1;33m) Perpanjang Masa Aktif Akun TROJAN GO \e[m"
echo -e "24\e[1;33m) Cek User Login TROJAN GO \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "25\e[1;33m) Buat Akun TROJAN QUIC \e[m"
echo -e "26\e[1;33m) Hapus Akun TROJAN QUIC \e[m"
echo -e "27\e[1;33m) Perpanjang Masa Aktif Akun TROJAN QUIC \e[m"
echo -e "28\e[1;33m) Cek User Login TROJAN QUIC \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "00\e[1;31m) Menu Utama \e[m"
echo -e "xx\e[1;31m) Keluar \e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m             🔰 LUXURY EDITION BY ZEROSSL 🔰            \e[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;36m) Select Number From [ 1 - 0 ] \e[m"
read -p "Silahkan Pilih Angka[ 1 - 0 ] : " menu
echo -e ""
case $menu in
1)
clear
addxtlstrojan
;;
2)
clear
delxtlstrojan
;;
3)
clear
renewxtlstrojan
;;
4)
clear
cekxtlstrojan
;;
5)
clear
addtrojanhdua
;;
6)
clear
deltrojanhdua
;;
7)
clear
renewtrojanhdua
;;
8)
clear
cektrojanhdua
;;
9)
clear
addgrpctrojan
;;
10)
clear
delgrpctrojan
;;
11)
clear
renewgrpctrojan
;;
12)
clear
cekgrpctrojan
;;
13)
clear
addtrojanwss
;;
14)
clear
deltrojanwss
;;
15)
clear
renewtrojanwss
;;
16)
clear
cektrojanwss
;;
17)
clear
addtrojanhttp
;;
18)
clear
deltrojanhttp
;;
19)
clear
renewtrojanhttp
;;
20)
clear
cektrojanhttp
;;
21)
clear
addtrgo
;;
22)
clear
deltrgo
;;
23)
clear
renewtrgo
;;
24)
clear
cektrgo
;;
25)
clear
addtrojanquic
;;
26)
clear
deltrojanquic
;;
27)
clear
renewtrojanquic
;;
28)
clear
cektrojanquic
;;
0)
clear
menu
;;
x)
clear
exit
;;
*)
clear
menu
;;
esac
