#!/bin/bash
export JAVA_HOME=/usr/local/openjdk-8/jre

####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

# Setup HDFS/Spark worker here

mkdir /usr/local/hadoop/hdfs
mkdir /usr/local/hadoop/hdfs/datanode

# Spark Configuration for Worker Node
mkdir -p $SPARK_HOME/conf
cp $SPARK_HOME/conf/spark-env.sh.template $SPARK_HOME/conf/spark-env.sh
echo "SPARK_MASTER_HOST=main" >> $SPARK_HOME/conf/spark-env.sh
echo "SPARK_PUBLIC_DNS=$(hostname -f)" >> $SPARK_HOME/conf/spark-env.sh
