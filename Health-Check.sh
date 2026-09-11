#!/bin/bash

# Ensure directory creation handled cleanly without errors
LOGDIR="/home/LogUpgrade"
LOGFILE="$LOGDIR/logbeforeupgrade.log"
mkdir -p "$LOGDIR"

{
echo "====== Hostname & Time ======="
hostname
date

echo -e "\n====== Disk Usage (df -h) ======="
df -h 2>/dev/null

echo -e "\n====== IP Addresses (ip a) ======="
ip a 2>/dev/null

echo -e "\n====== Routing Table (ip route) ======="
ip route 2>/dev/null

echo -e "\n====== Recent Kernel Messages (dmesg | tail -100) ======="
dmesg 2>/dev/null | tail -100

echo -e "\n====== Uptime ======="
uptime 2>/dev/null

echo -e "\n====== Memory Usage (free -h) ======="
free -h 2>/dev/null

echo -e "\n====== CPU Info (lscpu) ======="
lscpu 2>/dev/null

echo -e "\n====== Block Devices (lsblk) ======="
lsblk 2>/dev/null

echo -e "\n====== Mounted Filesystems ======="
mount 2>/dev/null | column -t 2>/dev/null || mount

echo -e "\n====== Top 20 Processes by Memory ======="
ps aux --sort=-%mem 2>/dev/null | head -20

echo -e "\n====== Open Network Ports (ss -tuln) ======="
ss -tuln 2>/dev/null

echo -e "\n====== Firewall Rules (iptables / ufw) ======="
sudo iptables -L -n 2>/dev/null || iptables -L -n 2>/dev/null
if command -v ufw &>/dev/null; then
    echo -e "\n--- UFW Status ---"
    sudo ufw status 2>/dev/null
fi

echo -e "\n====== Systemd Failed Services ======="
systemctl --failed 2>/dev/null

echo -e "\n====== System Journal (Last 50 lines) ======="
journalctl -xe 2>/dev/null | tail -50

echo -e "\n====== OS Release Info ======="
cat /etc/os-release 2>/dev/null

echo -e "\n====== Kernel Version ======="
uname -a

echo -e "\n====== Environment Variables ======="
printenv

echo -e "\n====== Crontab (Root) ======="
sudo crontab -l 2>/dev/null || crontab -l 2>/dev/null || echo "No crontab for root or permission denied"

echo -e "\n====== Security Status (SELinux / AppArmor) ======="
if command -v sestatus &>/dev/null; then
    sestatus
elif command -v aa-status &>/dev/null; then
    sudo aa-status 2>/dev/null
else
    echo "Neither SELinux nor AppArmor status tool found"
fi

echo -e "\n====== List of Installed Packages ======="
if command -v dpkg &>/dev/null; then
    echo "--- Debian/Ubuntu (dpkg) ---"
    dpkg -l 2>/dev/null
elif command -v rpm &>/dev/null; then
    echo "--- RHEL/CentOS (rpm) ---"
    rpm -qa 2>/dev/null | sort
else
    echo "Package manager not recognized"
fi

echo -e "\n====== File System Table (/etc/fstab) ======="
cat /etc/fstab 2>/dev/null

echo -e "\n"
} > "$LOGFILE" 2>&1

echo "Log generated successfully at: $LOGFILE"