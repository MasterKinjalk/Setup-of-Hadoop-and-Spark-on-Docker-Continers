####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM cs511p1-common

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

ADD config/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
COPY config/workconf/spark-defaults.conf $SPARK_HOME/conf/spark-defaults.conf
ADD config/workconf/spark-env.sh /usr/local/spark/conf/spark-env.sh


COPY ./setup-worker.sh ./setup-worker.sh
RUN /bin/bash setup-worker.sh

COPY ./start-worker.sh ./start-worker.sh
CMD ["/bin/bash", "start-worker.sh"]
