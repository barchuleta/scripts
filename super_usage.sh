#!/bin/bash

date=$(date \+%F)

logfile1=/root/log/usage/$date-rsc01-project_usage.txt
logfile2=/root/log/usage/$date-rsc02-project_usage.txt
logfile3=/root/log/usage/$date-home32-project_usage.txt

lafile1=/root/log/usage/$date-rsc01-project_usage.tex
lafile2=/root/log/usage/$date-rsc02-project_usage.tex
lafile3=/root/log/usage/$date-home32-project_usage.tex

echo $date > $logfile1
echo $date > $logfile2
echo $date > $logfile3

(
ssh 129.24.243.201 "/usr/local/ibrix/bin/ibrix_fs -i -f rsc01"
) >> $logfile1

(
ssh 129.24.243.201 "/usr/local/ibrix/bin/ibrix_fs -i -f rsc02"
) >> $logfile2

(
ssh 129.24.243.201 "/usr/local/ibrix/bin/ibrix_fs -i -f home32"
) >> $logfile3

(
total=0;
for s in `ls /rsc01/`
do echo -n -e "$s \t";
size=`du -sc /rsc01/$s | sed -e '2d' | awk '{print $1}'` ;
hsize=`awk -v val=$size -f $HOME/scripts/calc.awk`;
echo -n -e "$size\t";
echo $hsize;
total=$((total+size));
done
echo -n -e "total\t$total\t"
echo `awk -v val=$total -f $HOME/scripts/calc.awk`
) >> $logfile1

tmpfile=$(mktemp)

(
total=0;
for s in `ls -d /rsc02/*/*/* | grep -v STREAM`
do echo -n -e "$s \t";
size=`du -sc $s | sed -e '2d' | awk '{print $1}'` ;
hsize=`awk -v val=$size -f $HOME/scripts/calc.awk`;
echo -n -e "$size\t";
echo $hsize;
total=$((total+size));
done
echo -n -e "total\t$total\t"
echo `awk -v val=$total -f $HOME/scripts/calc.awk`
) >> $tmpfile

sed -e 's;/rsc02/;;' $tmpfile >> $logfile2

rm $tmpfile

(
total=0;
for s in `ls /exports/32/home/`
do echo -n -e "$s \t";
size=`du -sc /exports/32/home/$s | sed -e '2d' | awk '{print $1}'` ;
hsize=`awk -v val=$size -f $HOME/scripts/calc.awk`;
echo -n -e "$size\t";
echo $hsize;
total=$((total+size));
done
echo -n -e "total\t$total\t"
echo `awk -v val=$total -f $HOME/scripts/calc.awk`
) >> $logfile3

date=$(date \+%Y-%m-%d_%H%M)

echo $date >> $logfile1
echo $date >> $logfile2
echo $date >> $logfile3
