#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="effatastore"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'
clear
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'
clear
echo ""
figlet " SCRIPT" | lolcat
figlet " BY EFFATA STORE" | lolcat
echo -e "\e[32;1m.-----------------------------------------------.\e[0m"
echo -e "\e[32;1m|               \e[36;1mINFO SCRIPT VPS\e[0m                 \e[32;1m|\e[0m"
echo -e "\e[32;1m'-----------------------------------------------'\e[0m"
echo -e "           \e[031;1m> Premium Script By Effata ID Store <\e[0m" | lolcat
echo -e " \e[0;32m_______________________________________________\e[0m"
echo -e "\e[0;32m|    \e[1;35mFor OS Debian 10 & Ubuntu 20.04 64 bit     \e[0;32m|\e[0m"
echo -e "\e[0;32m|  \e[1;35mFor VPS with KVM and VMWare Effata ID Store         \e[0;32m|\e[0m"
echo -e "\e[0;32m|               \e[1;35mI HOPE YOU HAPPY                \e[0;32m|\e[0m"
echo -e "\e[0;32m|_______________________________________________\e[0;32m|\e[0m"
echo -e "\e[0;32m|_______________\e[36;1mTHANKYOU SUPPORT\e[0m\e[0;32m________________|\e[0m"
echo -e "               \e[0;32m'----------------'\e[0m"
