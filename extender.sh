#!/bin/bash

echo -e "Please enter the user name for the jobs you wish to extend and press enter"
echo -e "WARNING: This will effect all Jobs relating to this user\n"

read user

echo -e "Enter the new walltime (HH:MM:SS)and press enter\n"
read walltime

jobs=$(qstat | grep $user | awk '{print $1}' | awk -F. '{print $1}')
echo $jobs

if test -z "$jobs"; then
	echo -e "No jobs found \n"
	exit 0;
fi
sudo qalter -lwalltime=$walltime $jobs

