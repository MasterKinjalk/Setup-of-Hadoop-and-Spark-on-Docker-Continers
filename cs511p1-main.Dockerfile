####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM cs511p1-common

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

ADD ./config/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml

# Copy the Spark application and the CSV file into the Docker image
ADD ./sorting/spark_app.py /spark_app.py
ADD ./sorting/caps.csv /caps.csv


COPY ./setup-main.sh ./setup-main.sh
RUN /bin/bash setup-main.sh

COPY ./start-main.sh ./start-main.sh
CMD ["/bin/bash", "start-main.sh"]
