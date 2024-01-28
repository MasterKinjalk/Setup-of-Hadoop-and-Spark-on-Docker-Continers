#!/bin/bash

####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

/etc/init.d/ssh start
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/shared_rsa

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

# Start the HDFS DataNode service
hdfs datanode &

# Start the Spark Worker, connecting to the Spark master
$SPARK_HOME/sbin/start-slave.sh spark://main:7077 &

# Keep the script running
bash