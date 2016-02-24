#!/bin/bash

echo -e "Daily report for `date +%F`!" >> /root/diskUsage/alliance.`date +%F`.txt
echo -e "\n" >> /root/diskUsage/alliance.`date +%F`.txt
df -h  >> /root/diskUsage/alliance.`date +%F`.txt
echo -e "\n" >> /root/diskUsage/alliance.`date +%F`.txt
for i in $(ls /export/home/alliance);
        do
        	long_size=$(du -s /export/home/alliance/"$i" | awk '{print $1}')
		size=$(du -hs /export/home/alliance/"$i")
		echo $long_size, $size >> /root/diskUsage/alliance.`date +%F`.txt
        done
scp -r /root/diskUsage barchu02@sshgw1.hpc.unm.edu:~/
cat /root/diskUsage/alliance.`date +%F`.txt | mail -s "Serrano3 Usage for `date +%F`" systems@carc.unm.edu
