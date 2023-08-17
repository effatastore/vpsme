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
clear
# install Ruby & Yum
apt-get install ruby -y
# install lolcat
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
rm -f master.zip
cd lolcat-master/bin
gem install lolcat
# install figlet
apt-get install figlet 
# Install figlet ascii
sudo apt-get install figlet
git clone https://github.com/busyloop/lolcat
cd lolcat/bin && gem install lolcat
cd /usr/share
git clone https://github.com/xero/figlet-fonts
mv figlet-fonts/* figlet && rm –rf figlet-fonts

cd
rm -f lolcat.sh
