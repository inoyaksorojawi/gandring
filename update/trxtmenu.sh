#!/bin/bash
# wisnu
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
addtrojanxtls
;;
2)
deltrojanxtls
;;
3)
renewtrojanxtls
;;
4)
cektrojanxtls
;;
5)
addtrojanhdua
;;
6)
deltrojanhdua
;;
7)
renewtrojanhdua
;;
8)
cektrojanhdua
;;
9)
addtrojangrpc
;;
10)
deltrojangrpc
;;
11)
renewtrojangrpc
;;
12)
cektrojangrpc
;;
13)
addtrojanwss
;;
14)
deltrojanwss
;;
15)
renewtrojanwss
;;
16)
cektrojanwss
;;
17)
addtrojanhttp
;;
18)
deltrojanhttp
;;
19)
renewtrojanhttp
;;
20)
cektrojanhttp
;;
21)
addtrgo
;;
22)
deltrgo
;;
23)
renewtrgo
;;
24)
cektrgo
;;
25)
addtrojanquic
;;
26)
deltrojanquic
;;
27)
renewtrojanquic
;;
28)
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
