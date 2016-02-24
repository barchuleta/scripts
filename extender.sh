#!/bin/bash

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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

