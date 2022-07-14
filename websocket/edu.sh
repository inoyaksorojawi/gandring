#!/bin/bash
# Proxy python cdn trik
# wisnucokrosatrio
# ==========================================

# Link Hosting Kalian
wisnuvpn="raw.githubusercontent.com/pengkol/gandring/master/websocket"

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-nontls https://${wisnuvpn}/websocket.py
chmod +x /usr/local/bin/ws-nontls

# Installing Service
cat > /etc/systemd/system/ws-nontls.service << END
[Unit]
Description=WEBSOCKET NON TLS ROUTING NGUTER BY INOYAKSOROJAWI
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-nontls 2086
Restart=on-failure
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-nontls
systemctl restart ws-nontls

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-ovpn https://${wisnuvpn}/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn

# Installing Service
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=WEBSOCKET OVPN ROUTING DAM COLO PENGKOL BY SHANUM
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 8080
Restart=on-failure
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-ovpn
systemctl restart ws-ovpn

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-ovpntls https://${wisnuvpn}/ws-ovpntls.py
chmod +x /usr/local/bin/ws-ovpntls
# Installing Service
cat > /etc/systemd/system/ws-ovpntls.service << END
[Unit]
Description=WEBSOCKET OVPN ROUTING DAM COLO PENGKOL BY SHANUM
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpntls 2087
Restart=on-failure
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-ovpntls
systemctl restart ws-ovpntls

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-tls https://${wisnuvpn}/ws-tls.py
chmod +x /usr/local/bin/ws-tls

# Installing Service
cat > /etc/systemd/system/ws-tls.service << END
[Unit]
Description=WEBSOCKET TLS ROUTING GAJAH DEMAK BY WISNU CS
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-tls 2087
Restart=on-failure
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-tls
systemctl restart ws-tls
