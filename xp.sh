#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Author  : EffataStore
# (C) Copyright 2022
# =========================================
clear
#----- Auto Remove Vmess
data=( `cat /usr/local/etc/xray/vmess.json | grep '^#vms' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#vms $user" "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#vms $user $exp/,/^},{/d" /usr/local/etc/xray/vmess.json
sed -i "/^#vms $user $exp/,/^},{/d" /usr/local/etc/xray/vmessnone.json
rm -f /usr/local/etc/xray/$user-tls.json
rm -f /usr/local/etc/xray/$user-none.json
rm -f /usr/local/etc/xray/$user-clash-for-android.yaml
rm -f /home/vps/public_html/$user-clash-for-android.yaml
systemctl restart xray@vmess
systemctl restart xray@vmessnone
fi
done

#----- Auto Remove Vless
data=( `cat /usr/local/etc/xray/vless.json | grep '^#vls' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#vls $user" "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#vls $user $exp/,/^},{/d" /usr/local/etc/xray/vless.json
sed -i "/^#vls $user $exp/,/^},{/d" /usr/local/etc/xray/vlessnone.json
systemctl restart xray@vless.service
systemctl restart xray@vlessnone
fi
done

#----- Auto Remove Trojan
data=( `cat /usr/local/etc/xray/trojan.json | grep '^#trws' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#trws $user" "/usr/local/etc/xray/trojan.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#trws $user $exp/,/^},{/d" /usr/local/etc/xray/trojan.json
sed -i "/^#trws $user $exp/,/^},{/d" /usr/local/etc/xray/trojannone.json
systemctl restart xray@trojan
systemctl restart xray@trojannone
fi
done

#----- Auto Remove Trojan TCP
data=( `cat /usr/local/etc/xray/akunxtr.conf | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/akunxtr.conf
sed -i "/^#trx $user $exp/,/^},{/d" /usr/local/etc/xray/tcp.json
systemctl restart xray@tcp
fi
done

#----- Auto Remove VLESS TCP XTLS
data=( `cat /usr/local/etc/xray/config.json | grep '^#vxtls' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#vxtls $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#vxtls $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
systemctl restart xray.service
fi
done

echo -e " Delete Exp User Xray Success (Nevermore)"
echo 
echo -e " Back To Menu In 2 Sec"
sleep 2
menu
