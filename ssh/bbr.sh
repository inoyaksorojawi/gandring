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

#Optimasi Speed By wisnucokrosatrio
Add_To_New_Line(){
	if [ "$(tail -n1 $1 | wc -l)" == "0"  ];then
		echo "" >> "$1"
	fi
	echo "$2" >> "$1"
}

Check_And_Add_Line(){
	if [ -z "$(cat "$1" | grep "$2")" ];then
		Add_To_New_Line "$1" "$2"
	fi
}

Install_BBR(){
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Install TCP_BBR by wisnucokrosatrio..."
if [ -n "$(lsmod | grep bbr)" ];then
echo "TCP_BBR sudah diinstall."
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
return 1
fi
echo "Mulai menginstall TCP_BBR..."
modprobe tcp_bbr
Add_To_New_Line "/etc/modules-load.d/modules.conf" "tcp_bbr"
Add_To_New_Line "/etc/sysctl.conf" "net.core.default_qdisc = fq"
Add_To_New_Line "/etc/sysctl.conf" "net.ipv4.tcp_congestion_control = bbr"
sysctl -p
if [ -n "$(sysctl net.ipv4.tcp_available_congestion_control | grep bbr)" ] && [ -n "$(sysctl net.ipv4.tcp_congestion_control | grep bbr)" ] && [ -n "$(lsmod | grep "tcp_bbr")" ];then
	echo "TCP_BBR Install Success."
else
	echo "Gagal menginstall TCP_BBR."
fi
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
}

Optimize_Parameters(){
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Optimasi Parameters..."
Check_And_Add_Line "/etc/security/limits.conf" "* soft nofile 65535"
Check_And_Add_Line "/etc/security/limits.conf" "* hard nofile 65535"
Check_And_Add_Line "/etc/security/limits.conf" "root soft nofile 65535"
Check_And_Add_Line "/etc/security/limits.conf" "root hard nofile 65535"
Check_And_Add_Line "/etc/sysctl.conf" "fs.file-max = 65535"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_window_scaling = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.core.rmem_max = 67108864"
Check_And_Add_Line "/etc/sysctl.conf" "net.core.wmem_max = 67108864"
Check_And_Add_Line "/etc/sysctl.conf" "net.core.netdev_max_backlog = 90000000"
Check_And_Add_Line "/etc/sysctl.conf" "net.core.somaxconn = 8192"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_syncookies = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_tw_reuse = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_fin_timeout = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_keepalive_time = 1200"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.ip_local_port_range = 1024 65535"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_max_syn_backlog = 16777216"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_max_tw_buckets = 16777216"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_fastopen = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_mem = 16777216 33554432 67108864"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_rmem = 16777216 33554432 67108864"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_wmem = 16777216 33554432 67108864"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_mtu_probing = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_syncookies = 1 
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_synack_retries = 2"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_syn_retries = 5"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_slow_start_after_idle = 0"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.conf.all.send_redirects = 0"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.conf.default.send_redirects = 0"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_sack = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_fack = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_workaround_signed_windows = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.icmp_ignore_bogus_error_responses=1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.conf.all.accept_redirects = 0"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.conf.all.accept_source_route = 0"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.conf.all.secure_redirects = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.core.optmem_max = 32684"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.udp_wmem_min = 16777216"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.udp_rmem_min = 16777216"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.tcp_rfc1337 = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.ipv4.conf.all.secure_redirects = 1"
Check_And_Add_Line "/etc/sysctl.conf" "net.core.netdev_budget_usecs = 6000000"
Check_And_Add_Line "/etc/sysctl.conf" "net.core.netdev_budget = 6000000"
echo "Optimasi Parameters Selesai."
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
}
Install_BBR
Optimize_Parameters
rm -f /root/bbr.sh
