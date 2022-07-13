#!/bin/bash
# @ Copyrigt 2017 By zerossl
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

# Link Hosting Kalian Untuk Xray
wisnuvpnn="raw.githubusercontent.com/pengkol/gandring/master/xray"
# Link Hosting Kalian Untuk Trojan Go
wisnuvpnnn="raw.githubusercontent.com/pengkol/gandring/master/trojango"
MYIP=$(wget -qO- ipinfo.io/ip);
clear
domain=$(cat /root/domain)
apt install iptables iptables-persistent -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
apt install chronyd -y
timedatectl set-ntp true
systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
chronyc sourcestats -v
chronyc tracking -v
date

# / / Ambil Xray Core Version Terbaru
latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
#bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install-geodata
# / / Installation Xray Core
xraycore_link="https://github.com/XTLS/Xray-core/releases/download/v$latest_version/xray-linux-64.zip"
#xraycore_link="https://raw.githubusercontent.com/samratu/large/file/Xray-linux-64.zip"
# / / Make Main Directory
mkdir -p /usr/bin/xray
mkdir -p /etc/xray

# / / Unzip Xray Linux 64
cd `mktemp -d`
curl -sL "$xraycore_link" -o xray.zip
unzip -q xray.zip && rm -rf xray.zip
mv xray /usr/local/bin/xray
chmod +x /usr/local/bin/xray
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install-geodata
# Make Folder XRay
mkdir -p /var/log/xray/
uuid=$(cat /proc/sys/kernel/random/uuid)
#bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u root
cd /root/
#wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
mkdir -p /usr/local/etc/xray
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
##Generate acme certificate
curl https://get.acme.sh | sh
alias acme.sh=~/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
#/root/.acme.sh/acme.sh --issue -d "${domain}" --standalone --keylength ec-2048
/root/.acme.sh/acme.sh --issue -d "${domain}" --standalone --keylength ec-384
/root/.acme.sh/acme.sh --install-cert -d "${domain}" --ecc \
--fullchain-file /etc/ssl/private/fullchain.pem \
--key-file /etc/ssl/private/privkey.pem
chown -R nobody:nogroup /etc/xray
chmod 644 /etc/ssl/private/privkey.pem
chmod 644 /etc/ssl/private/fullchain.pem

#sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
#cd /root/
#wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
#bash acme.sh --install
#bash acme.sh --register-account -m djarumpentol01@gmail.com
#bash acme.sh --issue --standalone -d $domain --force
#bash acme.sh --installcert -d $domain --fullchainpath /etc/ssl/private/fullchain.pem --keypath /etc/ssl/private/privkey.pem
#chown -R nobody:nogroup /etc/xray
#chmod 644 /etc/ssl/private/privkey.pem
#chmod 644 /etc/ssl/private/fullchain.pem

#curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
#chmod +x /root/.acme.sh/acme.sh
#/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-2048
#~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/ssl/private/fullchain.pem --keypath /etc/ssl/private/privkey.pem --ecc

uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
# // Certificate File
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(cat /root/.acme.sh)
#domain.key=$(cat /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
# Buat Config Xray
cat > /etc/xray/config.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 443,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vmess/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      }
    }
END

uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
# // Certificate File
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(cat /root/.acme.sh)
#domain.key=$(cat /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
# Buat Config Xray
cat > /etc/xray/xvless.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 8880,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vmess/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      }
    }
END

uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
# // Certificate File
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(cat /root/.acme.sh)
#domain.key=$(cat /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
# Buat Config Xray
cat > /etc/xray/xtrojan.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 2095,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vmess/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      }
    }
END

uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
# // Certificate File
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(cat /root/.acme.sh)
#domain.key=$(cat /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
# Buat Config Xray
cat > /etc/xray/trojangrpc.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 2082,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vmess/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      }
    }
END

uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
# // Certificate File
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(cat /root/.acme.sh)
#domain.key=$(cat /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
# Buat Config Xray
cat > /usr/local/etc/xray/xvmess.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 8443,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vmess/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      }
    }
END

uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
# // Certificate File
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(cat /root/.acme.sh)
#domain.key=$(cat /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
# Buat Config Xray
cat > /usr/local/etc/xray/vlessquic.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 2053,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vmess/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      }
    }
END

uuid=$(cat /proc/sys/kernel/random/uuid)

domain=$(cat /root/domain)
# // Certificate File
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(cat /root/.acme.sh)
#domain.key=$(cat /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
# Buat Config Xray
cat > /etc/xray/xss.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 2083,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vmess/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      }
    }
END

uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
# // Certificate File
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(cat /root/.acme.sh)
#domain.key=$(cat /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
# Buat Config Xray
cat > /etc/xray/sstcp.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 2096,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vmess/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      }
    }
END

# / / Installation Xray Service
cat > /etc/systemd/system/xray.service << END
[Unit]
Description=XRAY ROUTING DAM COLO PENGKOL BY ZEROSSL
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /etc/xray/config.json
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
END

# / / Installation Xray Service
cat > /etc/systemd/system/xtrojan.service << END
[Unit]
Description=XTROJAN ROUTING DAM COLO PENGKOL BY ZEROSSL
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /etc/xray/xtrojan.json
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
END

# / / Installation Xray Service
cat > /etc/systemd/system/xvless.service << END
[Unit]
Description=XVLESS ROUTING DAM COLO PENGKOL BY SHANUM
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /etc/xray/xvless.json
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
END

cat > /etc/systemd/system/xvmess.service << END
[Unit]
Description=XVMESS ROUTING GAJAH DEMAK BY GANDRING
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /usr/local/etc/xray/xvmess.json
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
END

# / / Installation Xray Service
cat > /etc/systemd/system/xss.service << END
[Unit]
Description=XSHADOWSOCKS ROUTING DAM COLO PENGKOL BY WISNU
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /etc/xray/xss.json
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
END

# / / Installation Xray Service
cat > /etc/systemd/system/sstcp.service << END
[Unit]
Description=XSHADOWSOCKS ROUTING DAM COLO PENGKOL BY WISNU
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /etc/xray/sstcp.json
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
END

# / / Installation Xray Service
cat > /etc/systemd/system/trojangrpc.service << END
[Unit]
Description=XTROJAN ROUTING DAM COLO PENGKOL BY zerossl
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /etc/xray/trojangrpc.json
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
END

# / / Installation Xray Service
cat > /etc/systemd/system/vlessquic.service << END
[Unit]
Description=XVLESS ROUTING DAM COLO PENGKOL BY zerossl
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /usr/local/etc/xray/vlessquic.json
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
END

# // Enable & Start Service
# Accept port Xray
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2083 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2083 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

systemctl daemon-reload
systemctl stop xray
systemctl enable xray
systemctl start xray
systemctl restart xray

##restart&start service
systemctl daemon-reload
systemctl enable xtrojan
systemctl stop xtrojan
systemctl start xtrojan
systemctl restart xtrojan

##restart&start service
systemctl daemon-reload
systemctl enable xvless
systemctl stop xvless
systemctl start xvless
systemctl restart xvless

##restart&start service
systemctl daemon-reload
systemctl enable xss
systemctl stop xss
systemctl start xss
systemctl restart xss

##restart&start service
systemctl daemon-reload
systemctl enable sstcp
systemctl stop sstcp
systemctl start sstcp
systemctl restart sstcp

##restart&start service
systemctl daemon-reload
systemctl enable xvmess
systemctl stop xvmess
systemctl start xvmess
systemctl restart xvmess

##restart&start service
systemctl daemon-reload
systemctl enable trojangrpc
systemctl stop trojangrpc
systemctl start trojangrpc
systemctl restart trojangrpc

##restart&start service
systemctl daemon-reload
systemctl enable vlessquic
systemctl stop vlessquic
systemctl start vlessquic
systemctl restart vlessquic

# Install Trojan Go
latest_version="$(curl -s "https://api.github.com/repos/p4gefau1t/trojan-go/releases" | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
trojango_link="https://github.com/p4gefau1t/trojan-go/releases/download/v${latest_version}/trojan-go-linux-amd64.zip"
mkdir -p "/usr/bin/trojan-go"
mkdir -p "/etc/trojan-go"
cd `mktemp -d`
curl -sL "${trojango_link}" -o trojan-go.zip
unzip -q trojan-go.zip && rm -rf trojan-go.zip
mv trojan-go /usr/local/bin/trojan-go
chmod +x /usr/local/bin/trojan-go
mkdir /var/log/trojan-go/
touch /etc/trojan-go/akun.conf
touch /var/log/trojan-go/trojan-go.log

# Buat Config Trojan Go
cat > /etc/trojan-go/config.json << END
{
  "run_type": "server",
  "local_addr": "0.0.0.0",
  "local_port": 2053,
  "remote_addr": "127.0.0.1",
  "remote_port": 88,
  "log_level": 1,
  "log_file": "/var/log/trojan-go/trojan-go.log",
  "password": [
      "$uuid"
  ],
  "disable_http_check": true,
  "udp_timeout": 60,
  "ssl": {
    "verify": false,
    "verify_hostname": false,
    "cert": "/etc/ssl/private/fullchain.pem",
    "key": "/etc/ssl/private/privkey.pem",
    "key_password": "",
    "cipher": "",
    "curves": "",
    "prefer_server_cipher": false,
    "sni": "$domain",
    "alpn": [
      "http/1.1"
    ],
    "session_ticket": true,
    "reuse_session": true,
    "plain_http_response": "",
    "fallback_addr": "127.0.0.1",
    "fallback_port": 88,
    "fingerprint": "firefox"
  },
  "tcp": {
    "no_delay": true,
    "keep_alive": true,
    "prefer_ipv4": true
  },
  "mux": {
    "enabled": false,
    "concurrency": 8,
    "idle_timeout": 60
  },
  "websocket": {
    "enabled": true,
    "path": "/gandring",
    "host": "$domain"
  },
    "api": {
    "enabled": false,
    "api_addr": "",
    "api_port": 0,
    "ssl": {
      "enabled": false,
      "key": "",
      "cert": "",
      "verify_client": false,
      "client_cert": []
    }
  }
}
END

# Installing Trojan Go Service
cat > /etc/systemd/system/trojan-go.service << END
[Unit]
Description=TROJAN-GO ROUTING GAJAH DEMAK BY WISNU
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/trojan-go -config /etc/trojan-go/config.json
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
END

# Trojan Go Uuid
cat > /etc/trojan-go/uuid.txt << END
$uuid
END

# restart

systemctl daemon-reload
systemctl stop trojan-go
systemctl start trojan-go
systemctl enable trojan-go
systemctl restart trojan-go

#download 
cd /usr/bin
wget -O addvmess "https://${wisnuvpnn}/addvmess.sh"
wget -O addvmessgrpc "https://${wisnuvpnn}/addvmessgrpc.sh"
wget -O addvmesshdua "https://${wisnuvpnn}/addvmesshdua.sh"
wget -O addvmesshttp "https://${wisnuvpnn}/addvmesshttp.sh"
wget -O addvmessquic "https://${wisnuvpnn}/addvmessquic.sh"
wget -O addvlessxtls "https://${wisnuvpnn}/addvlessxtls.sh"
wget -O addvlesshttp "https://${wisnuvpnn}/addvlesshttp.sh"
wget -O addvlesshdua "https://${wisnuvpnn}/addvlesshdua.sh"
wget -O addvless "https://${wisnuvpnn}/addvless.sh"
wget -O addvlessgrpc "https://${wisnuvpnn}/addvlessgrpc.sh"
wget -O addvlessquic "https://${wisnuvpnn}/addvlessquic.sh"
wget -O addtrojan "https://${wisnuvpnn}/addtrojan.sh"
wget -O addtrojanxtls "https://${wisnuvpnn}/addtrojanxtls.sh"
wget -O addtrojangrpc "https://${wisnuvpnn}/addtrojangrpc.sh"
wget -O addtrojanwss "https://${wisnuvpnn}/addtrojanwss.sh"
wget -O addtrojanhttp "https://${wisnuvpnn}/addtrojanhttp.sh"
wget -O addtrojanhdua "https://${wisnuvpnn}/addtrojanhdua.sh"
wget -O addtrojanquic "https://${wisnuvpnn}/addtrojanquic.sh"
wget -O addtrojantester "https://${wisnuvpnn}/addtrohantester.sh"
wget -O addvmesstester "https://${wisnuvpnn}/addvmesstester.sh"
wget -O addvlesstester "https://${wisnuvpnn}/addvlesstester.sh"
wget -O addxtreme "https://${wisnuvpnn}/addxtreme.sh"
wget -O addxrayss "https://${wisnuvpnn}/addxrayss.sh"
chmod +x addvmess
chmod +x addvmessgrpc
chmod +x addvmesshdua
chmod +x addvmesshttp
chmod +x addvless
chmod +x addvlessgrpc
chmod +x addvlesshttp
chmod +x addvlesshdua
chmod +x addvlessxtls
chmod +x addvlessquic
chmod +x addtrojanxtls
chmod +x addtrojangrpc
chmod +x addtrojanwss
chmod +x addtrojanhttp
chmod +x addtrojanhdua
chmod +x addtrojanquic
chmod +x addxrayss
chmod +x addxtreme
chmod +x addvmesstester
chmod +x addvlesstester
chmod +x addtrojantester
wget -O cekvmess "https://${wisnuvpnn}/cekvmess.sh"
wget -O cekvmessgrpc "https://${wisnuvpnn}/cekvmessgrpc.sh"
wget -O cekvmesshdua "https://${wisnuvpnn}/cekvmesshdua.sh"
wget -O cekvmesshttp "https://${wisnuvpnn}/cekvmesshttp.sh"
wget -O cekvlessxtls "https://${wisnuvpnn}/cekvlessxtls.sh"
wget -O cekvlesshttp "https://${wisnuvpnn}/cekvlesshttp.sh"
wget -O cekvlesshdua "https://${wisnuvpnn}/cekvlesshdua.sh"
wget -O cekvless "https://${wisnuvpnn}/cekvless.sh"
wget -O cekvlessgrpc "https://${wisnuvpnn}/cekvlessgrpc.sh"
wget -O cekvlessquic "https://${wisnuvpnn}/cekvlessquic.sh"
wget -O cektrojanxtls "https://${wisnuvpnn}/cektrojanxtls.sh"
wget -O cektrojangrpc "https://${wisnuvpnn}/cektrojangrpc.sh"
wget -O cektrojanwss "https://${wisnuvpnn}/cektrojanwss.sh"
wget -O cektrojanhttp "https://${wisnuvpnn}/cektrojanhttp.sh"
wget -O cektrojanquic "https://${wisnuvpnn}/cektrojanquic.sh"
wget -O cektrojanhdua "https://${wisnuvpnn}/cektrojanhdua.sh"
wget -O cektrojantester "https://${wisnuvpnn}/cektrojantester.sh"
wget -O cekvmesstester "https://${wisnuvpnn}/cekvmesstester.sh"
wget -O cekvlesstester "https://${wisnuvpnn}/cekvlesstester.sh"
wget -O cekxrayss "https://${wisnuvpnn}/cekxrayss.sh"
chmod +x cekvmess
chmod +x cekvmessgrpc
chmod +x cekvmesshdua
chmod +x cekvmesshttp
chmod +x cekvlessquic
chmod +x cekvlesshttp
chmod +x cekvlesshdua
chmod +x cekvless
chmod +x cekvlessgrpc
chmod +x cekvlessxtls
chmod +x cektrojanxtls
chmod +x cektrojangrpc
chmod +x cektrojanwss
chmod +x cektrojanhttp
chmod +x cekxrayss
chmod +x cektrojanquic
chmod +x cektrojanhdua
chmod +x cekvlesstester
chmod +x cekvmesstester
chmod +x cektrojantester
wget -O delvmess "https://${wisnuvpnn}/delvmess.sh"
wget -O delvmessgrpc "https://${wisnuvpnn}/delvmessgrpc.sh"
wget -O delvmesshdua "https://${wisnuvpnn}/delvmesshdua.sh"
wget -O delvmesshttp "https://${wisnuvpnn}/delvmesshttp.sh"
wget -O delvlessxtls "https://${wisnuvpnn}/delvlessxtls.sh"
wget -O delvlesshttp "https://${wisnuvpnn}/delvlesshttp.sh"
wget -O delvlesshdua "https://${wisnuvpnn}/delvlesshdua.sh"
wget -O delxrayss "https://${wisnuvpnn}/delxrayss.sh"
wget -O delvless "https://${wisnuvpnn}/delvless.sh"
wget -O delvlessgrpc "https://${wisnuvpnn}/delvlessgrpc.sh"
wget -O delvlessquic "https://${wisnuvpnn}/delvlessquic.sh"
wget -O deltrojanquic "https://${wisnuvpnn}/deltrojanquic.sh"
wget -O deltrojanxtls "https://${wisnuvpnn}/deltrojanxtls.sh"
wget -O deltrojangrpc "https://${wisnuvpnn}/deltrojangrpc.sh"
wget -O deltrojanwss "https://${wisnuvpnn}/deltrojanwss.sh"
wget -O deltrojanhdua "https://${wisnuvpnn}/deltrojanhdua.sh"
wget -O deltrojanhttp "https://${wisnuvpnn}/deltrojanhttp.sh"
wget -O delvmesstester "https://${wisnuvpnn}/delvmesstester.sh"
wget -O delvlesstester "https://${wisnuvpnn}/delvlesstester.sh"
wget -O deltrojantester "https://${wisnuvpnn}/deltrojantester.sh"
wget -O delxtreme "https://${wisnuvpnn}/delxtreme.sh"
chmod +x delvmess
chmod +x delvmessgrpc
chmod +x delvmesshdua
chmod +x delvmesshttp
chmod +x delvless
chmod +x delvlessgrpc
chmod +x delvlessxtls
chmod +x delvlesshttp
chmod +x delvlesshdua
chmod +x delvlessquic
chmod +x deltrojanxtls
chmod +x deltrojangrpc
chmod +x deltrojanwss
chmod +x deltrojanhttp
chmod +x deltrojanhdua
chmod +x deltrojanquic
chmod +x deltrojantester
chmod +x delvmesstester
chmod +x delvlesstester
chmod +x delxtreme
chmod +x delxrayss
wget -O renewvmess "https://${wisnuvpnn}/renewvmess.sh"
wget -O renewvmessgrpc "https://${wisnuvpnn}/renewvmessgrpc.sh"
wget -O renewvmesshdua "https://${wisnuvpnn}/renewvmesshdua.sh"
wget -O renewvmesshttp "https://${wisnuvpnn}/renewvmesshttp.sh"
wget -O renewvlessxtls "https://${wisnuvpnn}/renewvlessxtls.sh"
wget -O renewvlesshttp "https://${wisnuvpnn}/renewvlesshttp.sh"
wget -O renewvlesshdua "https://${wisnuvpnn}/renewvlesshdua.sh"
wget -O renewvless "https://${wisnuvpnn}/renewvless.sh"
wget -O renewvlessgrpc "https://${wisnuvpnn}/renewvlessgrpc.sh"
wget -O renewvlessquic "https://${wisnuvpnn}/renewvlessquic.sh"
wget -O renewtrojanxtls "https://${wisnuvpnn}/renewtrojanxtls.sh"
wget -O renewtrojangrpc "https://${wisnuvpnn}/renewtrojangrpc.sh"
wget -O renewtrojanwss "https://${wisnuvpnn}/renewtrojanwss.sh"
wget -O renewtrojanhdua "https://${wisnuvpnn}/renewtrojanhdua.sh"
wget -O renewtrojanhttp "https://${wisnuvpnn}/renewtrojanhttp.sh"
wget -O renewtrojanquic "https://${wisnuvpnn}/renewtrojanquic.sh"
wget -O renewxrayss "https://${wisnuvpnn}/renewxrayss.sh"
wget -O certv2ray "https://${wisnuvpnn}/certv2ray.sh"
chmod +x renewvmess
chmod +x renewvmessgrpc
chmod +x renewvmesshdua
chmod +x renewvmesshttp
chmod +x renewvless
chmod +x renewvlesshdua
chmod +x renewvlessgrpc
chmod +x renewvlessxtls
chmod +x renewvlesshttp
chmod +x renewvlessquic
chmod +x renewtrojanxtls
chmod +x renewtrojangrpc
chmod +x renewtrojanwss
chmod +x renewtrojanhttp
chmod +x renewtrojanhdua
chmod +x renewtrojanquic
chmod +x renewxrayss
chmod +x certv2ray
wget -O addtrgo "https://${wisnuvpnnn}/addtrgo.sh"
wget -O deltrgo "https://${wisnuvpnnn}/deltrgo.sh"
wget -O renewtrgo "https://${wisnuvpnnn}/renewtrgo.sh"
wget -O cektrgo "https://${wisnuvpnnn}/cektrgo.sh"
chmod +x addtrgo
chmod +x deltrgo
chmod +x renewtrgo
chmod +x cektrgo

cp /root/domain /etc/xray
cp /root/domain /usr/local/etc/xray
cp /root/.acme.sh/$domain_ecc/fullcain.cer /etc/stunnel/stunnel.pem
cp /root/.acme.sh/$domain_ecc/$domain.key /etc/stunnel/stunnel.pem
cp /etc/ssl/private/fullchain.pem //etc/xray/xray.crt
cp /etc/ssl/private/privkey.pem //etc/xray/xray.key
