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


export PATH=/users/$USER/bin/spark/bin:/users/$USER/bin/spark/sbin:$PATH

#Exports libs
export LIBRARY_PATH=/opt/local/data_science/scala/lib:$LD_LIBRARY_PATH
#Exports man pages
export MANPATH=/opt/local/data_science/scala/lib/scala/man:$MANPATH

#Sets the java stuff
export JAVA_HOME=/opt/local/data_science/jdk/jre1.7.0_79
#This makes Hadoop kind of work
export HADOOP_INSTALL=/opt/local/data_science/hadoop
export HADOOP_HOME=$HADOOP_INSTALL
export PATH=$PATH:$HADOOP_INSTALL/bin
export PATH=$PATH:$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL
export HADOOP_CONF_DIR=${HADOOP_HOME}"/etc/hadoop"
export YARN_HOME=$HADOOP_INSTALL
alias hfs="hdfs dfs"
