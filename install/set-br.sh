#wget https://github.com/${GitUser}/
GitUser="effatastore"
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/${GitUser}/vpsme/main/rclone.conf"
git clone  https://github.com/${GitUser}/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
cd /usr/bin
wget -O autobackup "https://raw.githubusercontent.com/${GitUser}/vpsme/main/system/backupBot.sh"
wget -O backup "https://raw.githubusercontent.com/${GitUser}/vpsme/main/system/backup.sh"
wget -O bckp "https://raw.githubusercontent.com/${GitUser}/vpsme/main/system/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/${GitUser}/vpsme/main/system/restore.sh"
wget -O strt "https://raw.githubusercontent.com/${GitUser}/vpsme/main/system/strt.sh"
wget -O limit-speed "https://raw.githubusercontent.com/${GitUser}/vpsme/main/limit-speed.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
chmod +x limit-speed
chmod +x clear-log
cd
rm -f /root/set-br.sh
