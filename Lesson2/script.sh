#!/bin/bash

echo 'create RAID'
sudo mdadm --create --verbose /dev/md0 -l 10 -n 4 /dev/sd{c,d,e,f}
echo 'create .conf'
sudo mkdir /etc/mdadm
sudo touch /etc/mdadm/mdadm.conf
sudo chmod -R 777 /etc/mdadm/
sudo echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
sudo mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
echo 'reboot system'
sudo shutdown -r now
