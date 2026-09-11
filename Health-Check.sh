#!/bin/bash

mkdir LogUpgrade

LOGFILE="/home/LogUpgrade/logbeforeupgrade.log"
mkdir -p "$(dirname "$LOGFILE")"


{


echo -e "\n======hostname======="
hostname
date

echo -e "\n======Disk Usage ======= df -h"

df -h


echo -e "\n======IP Addresses ======= ip a"
ip a


echo -e "\n======Routing Table ======= ip route"
ip route



echo -e "\n======Recent Kernel Message ======= dmesg | tail -100"
dmesg | tail -100


echo -e "\n====== Uptime ======= uptime"
uptime


echo -e "\n====== Memory Usage ======= free -h"
free -h


echo -e "\n====== CPU Info ======= lscpu"
lscpu


echo -e "\n====== BLock Devices ======= lsblk"
lsblk



echo -e "\n====== Mounted Filesystems ======= mount | column -t"
mount | column -t


echo -e "\n====== Running Processes ======= ps aux --sort=-%mem | head -20"
ps aux --sort=-%mem | head -20


echo -e "\n====== Open Network Ports ======= ss -tuln"
ss -tuln

echo -e "\n====== Firewall Rules (iptables) ======= sudo iptables -L -n"
sudo iptables -L -n


echo -e "\n====== Systemd Service (Failed) ======= systemctl --failed"
systemctl --failed


echo -e "\n====== System Journal (Last 50 lines) ======= journalctl -xe | tail -50"
journalctl -xe | tail -50


echo -e "\n====== OS Release Info ======= cat /etc/os-release"
cat /etc/os-release


echo -e "\n====== Kernel Version ======= uname -a"
uname -a


echo -e "\n====== Environment Variables======= printenv"
printenv


echo -e "\n====== Crontab for root ======= sudo crontab -l"
sudo crontab -l


echo -e "\n====== SElinux Status======="
sestatus 2>/dev/null || echo "SElinux not installed"


echo -e "\n====== List of Installed Packages ======= rpm -qa | sort"
rpm -qa | sort


echo -e "\n====== List Of fstab ======= cat /etc/fstab"
cat /etc/fstab
echo
echo


} > "$LOGFILE"

