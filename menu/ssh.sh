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
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);

echo -e ""
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text         \e[30m═[\e[$box SSH & OpenVPN Menu\e[30m ]═         \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•1)\e[m \e[$below Create SSH & OpenVPN Account\e[m"
echo -e "    \e[$number (•2)\e[m \e[$below Trial Account SSH & OpenVPN\e[m"
echo -e "    \e[$number (•3)\e[m \e[$below Renew SSH & OpenVPN Account\e[m"
echo -e "    \e[$number (•4)\e[m \e[$below Delete SSH & OpenVPN Account\e[m"
echo -e "    \e[$number (•5)\e[m \e[$below Check User Login SSH & OpenVPN\e[m"
echo -e "    \e[$number (•6)\e[m \e[$below List Member SSH & OpenVPN\e[m"
echo -e "    \e[$number (•7)\e[m \e[$below Delete User Expired SSH & OpenVPN\e[m"
echo -e "    \e[$number (•8)\e[m \e[$below Set up Autokill SSH\e[m"
echo -e "    \e[$number (•9)\e[m \e[$below Cek Users Who Do Multi Login SSH\e[m"
echo -e "    \e[$number (10)\e[m \e[$below User List\e[m"
echo -e "    \e[$number (11)\e[m \e[$below User Lock\e[m"
echo -e "    \e[$number (12)\e[m \e[$below User Unlock\e[m"
echo -e "    \e[$number (13)\e[m \e[$below User Password\e[m"
echo -e "    \e[$number (14)\e[m \e[$below Restart Service Dropbear, Squid3,\e[m"
echo -e "          \e[$below OpenVPN & SSH\e[m"
echo -e ""
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text \e[$box x)   MENU                               \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -p "       Please Input Number  [1-14 or x] :  "  ssh
echo -e ""
case $ssh in
1)
add-ssh
;;
2)
trial
;;
3)
renew-ssh
;;
4)
del-ssh
;;
5)
cek-ssh
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
10)
user-list
;;
11)
user-lock
;;
12)
user-unlock
;;
13)
user-password
;;
14)
restart
;;
x)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
