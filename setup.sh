#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;32m'
ORANGE='\033[0;33m'
GREEN='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ssh/slhost.sh && chmod +x slhost.sh && ./slhost.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/xray/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ssh/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ssh/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ssh/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ssh/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ipsec/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ssh/set-br.sh && chmod +x set-br.sh && ./set-br.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/websocket/edu.sh && chmod +x edu.sh && ./edu.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ohp/ohp.sh && chmod +x ohp.sh && ./ohp.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/SLDNS/install-sldns && chmod +x install-sldns && ./install-sldns
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ipsaya.sh && chmod +x ipsaya.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/grpc/sl-grpc.sh && chmod +x sl-grpc.sh && screen -S sl-grpc ./sl-grpc.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/grpc/xray-grpc.sh && chmod +x xray-grpc.sh && screen -S xray-grpc ./xray-grpc.sh
wget https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/shadowsocks-plugin/install-ss-plugin.sh && chmod +x install-ss-plugin.sh && ./install-ss-plugin.sh
wget https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/squid3-install.sh && chmod +x squid3-install.sh && chmod +x squid3-install.sh && ./squid3-install.sh
wget https://raw.githubusercontent.com/mahpud896/UDP-Custom/main/install.sh && chmod +x install.sh && chmod +x install.sh && ./install.sh

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -f /root/install
rm -f /root/sl-grpc.sh
rm -f /root/install-sldns
rm -f /root/install-ss-plugin.sh
rm -f /root/squid3-install.sh
rm -f /root/install.sh

cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=nekopoi.care

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/mahpud896/SaktiSSH/main/ssh/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - UDP Custom              : 1-65535"  | tee -a log-install.txt
echo "   - SlowDNS SSH             : ALL Port SSH"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, 2253"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - CloudFront Websocket    : "  | tee -a log-install.txt
echo "   - SSH Websocket TLS       : 443"  | tee -a log-install.txt
echo "   - SSH Websocket HTTP      : 8880"  | tee -a log-install.txt
echo "   - Websocket OpenVPN       : 2086"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - XRAYS VMESS GRPC        : 1180"  | tee -a log-install.txt
echo "   - XRAYS VLESS GRPC        : 2280"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - TrojanGo                : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
