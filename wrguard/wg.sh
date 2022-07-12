#!/bin/bash
# Debian 9 & 10 64bit
# Ubuntu 18.04 & 20.04 bit
# Centos 7 & 8 64bit 
# By wisnucokrosatrio
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
 ==========================================
#Link Hosting Kalian
wisnuvpn="raw.githubusercontent.com/inoyaksorojawi/gandring/master/wrguard"

# Check OS version
if [[ -e /etc/debian_version ]]; then
	source /etc/os-release
	OS=$ID # debian or ubuntu
elif [[ -e /etc/centos-release ]]; then
	source /etc/os-release
	OS=centos
fi

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[information]${Font_color_suffix}"

if [[ -e /etc/wireguard/params ]]; then
	echo -e "${Info} WireGuard sudah diinstal, silahkan ketik addwg untuk menambah client."
	exit 1
fi

echo -e "${Info} Wireguard Script By Wisnu Cokro Satrio"
# Detect public IPv4 address and pre-fill for the user

# Detect public interface and pre-fill for the user
SERVER_PUB_NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');

# Install WireGuard tools and module
	if [[ $OS == 'ubuntu' ]]; then
	apt install -y wireguard
elif [[ $OS == 'debian' ]]; then
	echo "deb http://deb.debian.org/debian/ unstable main" >/etc/apt/sources.list.d/unstable.list
	printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' >/etc/apt/preferences.d/limit-unstable
	apt update
	apt install -y wireguard-tools iptables iptables-persistent
	apt install -y linux-headers-$(uname -r)
elif [[ ${OS} == 'centos' ]]; then
	curl -Lo /etc/yum.repos.d/wireguard.repo https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/repo/epel-7/jdoss-wireguard-epel-7.repo
	yum -y update
	yum -y install wireguard-dkms wireguard-tools
	fi
apt install iptables iptables-persistent -y
# Make sure the directory exists (this does not seem the be the case on fedora)
mkdir -p /etc/wireguard
chmod 600 -R /etc/wireguard

sleep 1
echo -e "[ ${green}INFO$NC ] Generate key wireguard"
SERVER_PRIV_KEY=$(wg genkey)
SERVER_PUB_KEY=$(echo "$SERVER_PRIV_KEY" | wg pubkey)

# Save WireGuard settings
sleep 1
echo -e "[ ${green}INFO$NC ] Create config wireguard"
cat> /etc/wireguard/params << END
SERVER_PUB_NIC=$SERVER_PUB_NIC
SERVER_WG_NIC=wg0
SERVER_WG_IPV4=10.22.22.1
SERVER_PORT=591
SERVER_PRIV_KEY=$SERVER_PRIV_KEY
SERVER_PUB_KEY=$SERVER_PUB_KEY
END

source /etc/wireguard/params

# Add server interface
sleep 1
echo -e "[ ${green}INFO$NC ] Adding server interface"
cat> /etc/wireguard/wg0.conf << END
[Interface]
Address = $SERVER_WG_IPV4/24
ListenPort = $SERVER_PORT
PrivateKey = $SERVER_PRIV_KEY
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT;iptables -t nat -A POSTROUTING -o $SERVER_PUB_NIC -j MASQUERADE;
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT;iptables -t nat -D POSTROUTING -o $SERVER_PUB_NIC -j MASQUERADE;
END

sleep 1
echo -e "[ ${green}INFO$NC ] Setting up iptables..."
iptables -t nat -I POSTROUTING -s 10.22.22.1/24 -o $SERVER_PUB_NIC -j MASQUERADE
iptables -I INPUT 1 -i wg0 -j ACCEPT
iptables -I FORWARD 1 -i $SERVER_PUB_NIC -o wg0 -j ACCEPT
iptables -I FORWARD 1 -i wg0 -o $SERVER_PUB_NIC -j ACCEPT
iptables -I INPUT 1 -i $SERVER_PUB_NIC -p udp --dport 591 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

sleep 1

# Service Stunnel5 systemctl restart stunnel5
cat > /lib/systemd/system/wg-quick@.service << END
[Unit]
Description=WireGuard ROUTING DAM COLO PENGKOL BY GANDRING
After=network-online.target nss-lookup.target
Wants=network-online.target nss-lookup.target
PartOf=wg-quick.target
Documentation=man:wg-quick(8)
Documentation=man:wg(8)
Documentation=https://www.wireguard.com/
Documentation=https://www.wireguard.com/quickstart/
Documentation=https://github.com/inoyaksorojawi
Documentation=https://github.com/wisnucokrosatrio

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/wg-quick up %i
ExecStop=/usr/bin/wg-quick down %i
Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity

[Install]
WantedBy=multi-user.target
END

echo -e "[ ${green}INFO$NC ] Enable wireguard services..."
systemctl daemon-reload
systemctl enable wg-quick@wg0
systemctl start wg-quick@wg0
systemctl restart wg-quick@wg0

# Tambahan
wget -q -O /usr/bin/addwg "https://raw.githubusercontent.com/inoyaksorojawi/gandring/master/wrguard/addwg.sh" && chmod +x /usr/bin/addwg
wget -q -O /usr/bin/delwg "https://raw.githubusercontent.com/inoyaksorojawi/gandring/master/wrguard/delwg.sh" && chmod +x /usr/bin/delwg
wget -q -O /usr/bin/cekwg "https://raw.githubusercontent.com/inoyaksorojawi/gandring/master/wrguard/cekwg.sh" && chmod +x /usr/bin/cekwg
wget -q -O /usr/bin/renewwg "https://raw.githubusercontent.com/inoyaksorojawi/gandring/master/wrguard/renewwg.sh" && chmod +x /usr/bin/renewwg
wget -q -O /usr/bin/trialwg "https://raw.githubusercontent.com/inoyaksorojawi/gandring/master/wrguard/trialwg.sh" && chmod +x /usr/bin/trialwg
wget -q -O /usr/bin/portwg "https://raw.githubusercontent.com/inoyaksorojawi/gandring/master/wrguard/portwg.sh" && chmod +x /usr/bin/portwg
#wget -q -O /usr/bin/wgmenu "https://raw.githubusercontent.com/inoyaksorojawi/gandring/master/update/wgmenu.sh" && chmod +x /usr/bin/wgmenu
sleep 1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "Wireguard install successfully..."
sleep 5
cd
rm -f /root/wg.sh
