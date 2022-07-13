#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
#cat /usr/bin/bannerVLESS | lolcat
echo -e ""
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m               🔰 MENU LAYANAN VLESS 🔰                 \e[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "01\e[1;33m)  Buat Akun Vless Websocket \e[m"
echo -e "02\e[1;33m)  Hapus Akun Vless Websocket \e[m"
echo -e "03\e[1;33m)  Perpanjang Masa Aktif Akun Vless Websocket \e[m"
echo -e "04\e[1;33m)  Cek User Login Vless Websocket \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "05\e[1;33m)  Buat Akun Vless gRPC \e[m"
echo -e "06\e[1;33m)  Hapus Akun Vless gRPC \e[m"
echo -e "07\e[1;33m)  Perpanjang Masa Aktif Akun Vless gRPC \e[m"
echo -e "08\e[1;33m)  Cek User Login Vless gRPC \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "09\e[1;33m)  Buat Akun Vless XTLS \e[m"
echo -e "10\e[1;33m)  Hapus Akun Vless XTLS \e[m"
echo -e "11\e[1;33m)  Perpanjang Masa Aktif Akun Vless XTLS \e[m"
echo -e "12\e[1;33m)  Cek User Login Vless XTLS \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "13\e[1;33m)  Buat Akun VLESS H2C \e[m"
echo -e "14\e[1;33m)  Hapus Akun VLESS H2C \e[m"
echo -e "15\e[1;33m)  Perpanjang Masa Aktif Akun VLESS H2C \e[m"
echo -e "16\e[1;33m)  Cek User Login VLESS H2C \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "17\e[1;33m)  Buat Akun VLESS HTTP \e[m"
echo -e "18\e[1;33m)  Hapus Akun VLESS HTTP \e[m"
echo -e "19\e[1;33m)  Perpanjang Masa Aktif Akun VLESS HTTP \e[m"
echo -e "20\e[1;33m)  Cek User Login VLESS HTTP \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "21\e[1;33m)  Buat Akun VLESS QUIC \e[m"
echo -e "22\e[1;33m)  Hapus Akun VLESS QUIC \e[m"
echo -e "23\e[1;33m)  Perpanjang Masa Aktif Akun VLESS QUIC \e[m"
echo -e "24\e[1;33m)  Cek User Login VLESS QUIC \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "00\e[1;31m)  Menu Utama \e[m"
echo -e "xx\e[1;31m)  Keluar \e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m            🔰 LUXURY EDITION BY ZEROSSL 🔰             \e[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Silahkan Pilih Angka[ 1 - 0 ] : " menu
echo -e ""
case $menu in
1)
clear
addvless
;;
2)
clear
delvless
;;
3)
clear
renewvless
;;
4)
clear
cekvless
;;
5)
clear
addvlessgrpc
;;
6)
clear
delvlessgrpc
;;
7)
clear
renewvlessgrpc
;;
8)
clear
cekvlessgrpc
;;
9)
clear
addvlessxtls
;;
10)
clear
delvlessxtls
;;
11)
clear
renewvlessxtls
;;
12)
clear
cekvlessxtls
;;
13)
clear
addvlesshdua
;;
14)
clear
delvlesshdua
;;
15)
clear
renewvlesshdua
;;
16)
clear
cekvlesshdua
;;
17)
clear
addvlesshttp
;;
18)
clear
delvlesshttp
;;
19)
clear
renewvlesshttp
;;
20)
clear
cekvlesshttp
;;
21)
clear
addvlessquic
;;
22)
clear
delvlessquic
;;
23)
clear
renewvlessquic
;;
24)
clear
cekvlessquic
;;
0)
clear
menu
;;
x)
clear
exit
;;
esac
