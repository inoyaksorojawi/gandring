#!/bin/bash
# gandring

#cat /usr/bin/bannerVLESS | lolcat
echo -e ""
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m               🔰 MENU LAYANAN VLESS 🔰                 \e[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "01)  Buat Akun Vless Websocket"
echo -e "02)  Hapus Akun Vless Websocket"
echo -e "03)  Perpanjang Masa Aktif Akun Vless Websocket"
echo -e "04)  Cek User Login Vless Websocket"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "05)  Buat Akun Vless gRPC"
echo -e "06)  Hapus Akun Vless gRPC"
echo -e "07)  Perpanjang Masa Aktif Akun Vless gRPC"
echo -e "08)  Cek User Login Vless gRPC"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "09)  Buat Akun Vless XTLS"
echo -e "10)  Hapus Akun Vless XTLS"
echo -e "11)  Perpanjang Masa Aktif Akun Vless XTLS"
echo -e "12)  Cek User Login Vless XTLS"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "13)  Buat Akun VLESS H2C"
echo -e "14)  Hapus Akun VLESS H2C"
echo -e "15)  Perpanjang Masa Aktif Akun VLESS H2C"
echo -e "16)  Cek User Login VLESS H2C"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "17)  Buat Akun VLESS HTTP"
echo -e "18)  Hapus Akun VLESS HTTP"
echo -e "19)  Perpanjang Masa Aktif Akun VLESS HTTP"
echo -e "20)  Cek User Login VLESS HTTP"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "21)  Buat Akun VLESS QUIC"
echo -e "22)  Hapus Akun VLESS QUIC"
echo -e "23)  Perpanjang Masa Aktif Akun VLESS QUIC"
echo -e "24)  Cek User Login VLESS QUIC"
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
addvless
;;
2)
delvless
;;
3)
renewvless
;;
4)
cekvless
;;
5)
addvlessgrpc
;;
6)
delvlessgrpc
;;
7)
renewvlessgrpc
;;
8)
cekvlessgrpc
;;
9)
addvlessxtls
;;
10)
delvlessxtls
;;
11)
renewvlessxtls
;;
12)
cekvlessxtls
;;
13)
addvlesshdua
;;
14)
delvlesshdua
;;
15)
renewvlesshdua
;;
16)
cekvlesshdua
;;
17)
addvlesshttp
;;
18)
delvlesshttp
;;
19)
renewvlesshttp
;;
20)
cekvlesshttp
;;
21)
addvlessquic
;;
22)
delvlessquic
;;
23)
renewvlessquic
;;
24)
cekvlessquic
;;
0)
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
