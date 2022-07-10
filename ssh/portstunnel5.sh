#!/bin/bash
# Script by : wisnu cokro satrio
rm -f /root/opensshport
rm -f /root/dropbearport
rm -f /root/stunnel5port
rm -f /root/openvpnport
rm -f /root/squidport
opensshport="$(netstat -ntlp | grep -i ssh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
stunnel5port="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
squidport="$(cat /etc/squid3/squid.conf | grep -i http_port | awk '{print $2}')"
echo $opensshport > /root/opensshport
cat > /root/opensshport <<-END
$opensshport
END
echo $dropbearport > /root/dropbearport
cat > /root/dropbearport <<-END
$dropbearport
END
echo $stunnel5port > /root/stunnel5port
cat > /root/stunnel5port <<-END
$stunnel5port
END
echo $openvpnport > /root/openvpnport
cat > /root/openvpnport <<-END
$openvpnport
END
echo $squidport > /root/squidport
cat > /root/squidport <<-END
$squidport
END

cd
clear
echo -e "\e[0m                                                   "
echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
echo -e "\e[0m                                                   "
echo -e "\e[0;37m                    Luxury Edition by wisnu     "
echo -e "\e[0m                                                   "
echo -e "\e[0;37m                    Stunnel5  Port              "
echo -e "\e[0;37m                    "$stunnel5port
echo -e "\e[0m                                                   "
read -p "       Ketik Port Yang Akan Diganti? : " Port
egrep "^$Port" /root/stunnel5port >/dev/null
if [ $? -eq 0 ]; then
	read -p "            From Port $Port -> Port " Port_New
	if grep -Fxq $Port_New /root/opensshport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[0;32m              OpenSSH Port Conflict              "
		echo -e "\e[0;32m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
		echo ""
        read -sp " Press ENTER to go back"
        echo ""
        changeport
	fi
	if grep -Fxq $Port_New /root/dropbearport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[0;32m              Dropbear Port Conflict              "
		echo -e "\e[0;32m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
		echo ""
        read -sp " Press ENTER to go back"
        echo ""
        changeport
	fi
	if grep -Fxq $Port_New /root/openvpnport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[0;32m              Openvpn Port Conflict               "
		echo -e "\e[0;32m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
		echo ""
        read -sp " Press ENTER to go back"
        echo ""
        changeport
	fi
	if grep -Fxq $Port_New /root/squidport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[0;32m               Squid3 Port Conflict               "
		echo -e "\e[0;32m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
		echo ""
        read -sp " Press ENTER to go back"
        echo ""
        changeport
	fi
	Port_Change="s/$Port/$Port_New/g";
	sed -i $Port_Change /etc/stunnel5/stunnel5.conf
	service stunnel5 restart > /dev/null
	rm -f /root/stunnel5port
	stunnel5port="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
	echo -e "\e[0m                                                   "
	echo -e "\e[0;37m                    Luxury Edition by wisnu     "
	echo -e "\e[0m                                                   "
	echo -e "\e[0;37m                    Stunnel5  Port              "
	echo -e "\e[0;37m                    "$stunnel5port
	echo -e "\e[0m                                                   "
	echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
    echo ""
    read -sp " Press ENTER to go back"
    echo ""
    changeport
else
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[0;32m                 Port Doesnt Exit                 "
	echo -e "\e[0m                                                   "
	echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
	echo ""
    read -sp " Press ENTER to go back"
    echo ""
    changeport
fi
