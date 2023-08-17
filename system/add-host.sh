#!/bin/bash
# // CODE WARNA
export RED='\e[1;31m'
export GREEN='\e[0;32m'
export BLUE='\e[0;34m'
export NC='\e[0m'

#wget https://github.com/${GitUser}/
GitUser="effatastore"

# // MY IPVPS
export MYIP=$(curl -sS ipv4.icanhazip.com)

# // VALID SCRIPT
clear
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl -sS https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
sleep 0.1
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi

# // GMAIL && DOMAIN
clear
export default_email=$( curl -sS https://raw.githubusercontent.com/${GitUser}/email/main/default.conf )
export emailcf=$(cat /usr/local/etc/xray/email)

clear
echo ""
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
echo -e "\E[44;1;39m                Add Domain                \E[0m"
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
echo ""

echo "Please Input Your Pointing Domain In Cloudflare "
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" > /usr/local/etc/xray/domain

export dom=$(cat /etc/xray/domain)
export domain=$(cat /usr/local/etc/xray/domain)

sed -i "s/sshws.${dom}/sshws.${domain}/g" /usr/local/etc/xray/config.json;
rm -f /etc/xray/domain;
echo "$host" > /etc/xray/domain

echo ""
echo -e "\e[1;32m════════════════════════════════════════════════════════════\e[0m"
echo ""
echo -e "   \e[1;32mPlease enter your email Domain/Cloudflare."
echo -e "   \e[1;31m(Press ENTER for default email)\e[0m"

# // EMAIL 
read -p "   Email : " email
default=${default_email}
new_email=$email
if [[ $email == "" ]]; then
sts=$default_email
else
sts=$new_email
fi

# // GMAIL
rm -f /usr/local/etc/xray/email
echo $sts > /usr/local/etc/xray/email
echo -e "[${GREEN} Success Add Email ${NC}]"
sleep 0.3

# // UPDATE CERT SSL
clear
echo
echo "Automatical Update Your Certificate SSL"
sleep 0.3
echo Starting Update SSL Certificate
sleep 0.3

# // STOP XRAY
systemctl stop xray.service
systemctl stop xray@none

# // GENERATE CERT
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain -d sshws.$domain --standalone -k ec-256 --listen-v6
~/.acme.sh/acme.sh --installcert -d $domain -d sshws.$domain --fullchainpath /usr/local/etc/xray/xray.crt --keypath /usr/local/etc/xray/xray.key --ecc

# // RESTART XRAY
systemctl restart xray.service
systemctl restart xray@none

clear
echo -e ""
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
echo -e "\E[44;1;39m        PERTUKARAN DOMAIN SELESAI         \E[0m"
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
