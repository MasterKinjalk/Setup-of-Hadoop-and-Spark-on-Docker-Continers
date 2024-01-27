####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM cs511p1-common

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

ADD config/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh


COPY ./setup-main.sh ./setup-main.sh
RUN /bin/bash setup-main.sh

COPY ./start-main.sh ./start-main.sh
CMD ["/bin/bash", "start-main.sh"]
