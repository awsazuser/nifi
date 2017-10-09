#!/bin/sh

#####sed -i -r "s|^nifi.web.http.host=.*$|nifi.web.http.host=`hostname`|g" ${NIFI_HOME}/conf/nifi.properties
sed -i -r "s|^nifi.zookeeper.connect.string=.*$|nifi.zookeeper.connect.string=zookeeper1:2181|g" ${NIFI_HOME}/conf/nifi.properties
sed -i -r "s|^nifi.cluster.is.node=.*$|nifi.cluster.is.node=true|g" ${NIFI_HOME}/conf/nifi.properties
sed -i -r "s|^nifi.cluster.node.address=.*$|nifi.cluster.node.address=`hostname`|g" ${NIFI_HOME}/conf/nifi.properties
sed -i -r "s|^nifi.cluster.node.protocol.port=.*$|nifi.cluster.node.protocol.port=8081|g" ${NIFI_HOME}/conf/nifi.properties

${NIFI_HOME}/bin/nifi.sh $1
