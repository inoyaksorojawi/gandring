#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

MYIP=$(curl -sS ipv4.icanhazip.com)

clear
SSTPTrial=trial`</dev/urandom tr -dc A-Z0-9 | head -c4`
Hariii=1
Passss=1
IP=$(curl -sS ipv4.icanhazpip.com);
sstp="$(cat ~/log-install.txt | grep -i SSTP | cut -d: -f2|sed 's/ //g')"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m      ⇱ Trial SSTP Account ⇲       \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
until [[ $SSTPTrial =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		
		CLIENT_EXISTS=$(grep -w $SSTPTrial /var/lib/wisnucs/data-SSTPTrial-sstp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done

exp=`date -d "$Hariii days" +"%Y-%m-%d"`
cat >> /home/sstp/sstp_account <<EOF
$SSTPTrial * $Passss *
EOF
echo -e "### $SSTPTrial $exp">>"/var/lib/wisnucs/data-SSTPTrial-sstp"
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m      ⇱ Trial SSTP Account ⇲       \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Server IP : $IP"
echo -e "Username : $SSTPTrial"
echo -e "Password : $Passss"
echo -e "Port : $sstp"
echo -e "Cert : http://$IP:88/server.crt"
echo -e "Expired On : $exp"
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
sstp-menu
